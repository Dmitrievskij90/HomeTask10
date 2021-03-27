//
//  MainViewController.swift
//  HomeTask10.1
//
//  Created by Konstantin Dmitrievskiy on 25.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var circleView = UIImageView()
    private let width = 100
    private let height = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapDismissRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDismissTap(_:)))
        circleView.addGestureRecognizer(tapDismissRecognizer)
        let tapFindRecognizer = UITapGestureRecognizer(target: self, action: #selector(onFindTap(_:)))
        view.addGestureRecognizer(tapFindRecognizer)
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .skyColor
        self.view = view
        
        circleView.image = UIImage(systemName: "cloud.fill")
        circleView.tintColor = .white
        circleView.isUserInteractionEnabled = true
    }
    
    @objc func onFindTap(_ sender: UITapGestureRecognizer) {
        let locatinon = sender.location(in: view)
        let x = Int(locatinon.x)
        let y = Int(locatinon.y)
        circleView.frame = CGRect(x: x, y: y, width: width, height: height)
        view.addSubview(circleView)
    }
    
    @objc func onDismissTap(_ sender: UITapGestureRecognizer) {
        circleView.removeFromSuperview()
    }
}

extension UIColor {
    static var skyColor: UIColor {
        return UIColor(red: 164 / 255, green: 235 / 255, blue: 243 / 255, alpha: 1)
    }
}
