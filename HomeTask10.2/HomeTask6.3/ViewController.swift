//
//  ViewController.swift
//  HomeTask6.3
//
//  Created by Konstantin Dmitrievskiy on 10.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var ballImageView = UIImageView()
    private let restrictView = UIView()
    
    private var x = 195
    private var y = 422
    private let width = 60
    private let height = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwiperecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onLeftSwipe(_:)))
        leftSwiperecognizer.direction = .left
        let rightSwiperecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onRightSwipe(_:)))
        rightSwiperecognizer.direction = .right
        let upSwiperecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onUpSwipe(_:)))
        upSwiperecognizer.direction = .up
        let downSwiperecognizer = UISwipeGestureRecognizer(target: self, action: #selector(onDownSwipe(_:)))
        downSwiperecognizer.direction = .down
        ballImageView.addGestureRecognizer(leftSwiperecognizer)
        ballImageView.addGestureRecognizer(rightSwiperecognizer)
        ballImageView.addGestureRecognizer(upSwiperecognizer)
        ballImageView.addGestureRecognizer(downSwiperecognizer)
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    
        ballImageView.image = UIImage(named: "circle")
        ballImageView.isUserInteractionEnabled = true
        
        restrictView.backgroundColor = .systemPink
        
        view.addSubview(restrictView)
        view.addSubview(ballImageView)
    }
    
    override func viewWillLayoutSubviews() {
        ballImageView.layer.cornerRadius = 30
        ballImageView.clipsToBounds = true

        setupLayout()
    }
    
    @objc func onLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        if x <= Int(restrictView.frame.minX) {
            x = Int(restrictView.frame.minX)
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            x -= 20
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    @objc func onRightSwipe(_ sender: UISwipeGestureRecognizer) {
        if x >= Int(restrictView.bounds.width - 60) {
            x = Int(restrictView.bounds.width - 60)
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            x += 20
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    @objc func onUpSwipe(_ sender: UISwipeGestureRecognizer) {
        if y <= Int(restrictView.frame.minY) {
            y = Int(restrictView.frame.minY)
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            y -= 20
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    @objc func onDownSwipe(_ sender: UISwipeGestureRecognizer) {
        if ballImageView.bottomAnchor == restrictView.bottomAnchor {
            y -= 1
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            y += 20
            ballImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
   private func setupLayout() {
        restrictView.translatesAutoresizingMaskIntoConstraints = false
        ballImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            restrictView.topAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor) ?? view.topAnchor),
            restrictView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            restrictView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restrictView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ballImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ballImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImageView.heightAnchor.constraint(equalToConstant: 60),
            ballImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}

