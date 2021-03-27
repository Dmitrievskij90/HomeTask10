//
//  MainViewController.swift
//  HomeTask10.3
//
//  Created by Konstantin Dmitrievskiy on 23.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let ballImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(onRotation(_:)))
        ballImageView.isUserInteractionEnabled = true
        ballImageView.addGestureRecognizer(panRecognizer)
        ballImageView.addGestureRecognizer(rotationRecognizer)
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .grassColor
        self.view = view
        
        ballImageView.image = UIImage(named: "rugby ball")
        ballImageView.contentMode = .scaleAspectFit
        
        view.addSubview(ballImageView)
    }
    
    override func viewWillLayoutSubviews() {
        ballImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ballImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ballImageView.heightAnchor.constraint(equalToConstant: 100),
            ballImageView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func onRotation(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}

extension UIColor {
    static var grassColor: UIColor {
        return UIColor(red: 0, green: 175 / 255, blue: 145 / 255, alpha: 1)
    }
}
