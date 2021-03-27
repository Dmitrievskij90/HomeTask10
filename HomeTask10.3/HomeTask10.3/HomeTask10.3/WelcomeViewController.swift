//
//  ViewController.swift
//  HomeTask10.3
//
//  Created by Konstantin Dmitrievskiy on 23.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let startButton = UIButton(type: .system)
    private let backgroundImageView = UIImageView()
    private let bottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationItemBackground()
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        setupUI()
        
        view.addSubview(backgroundImageView)
        view.addSubview(bottomView)
        view.addSubview(startButton)
    }
    
    @objc func startButtonPressed() {
        let viewController = MainViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            startButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "player")
        
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = UIColor(red: 192 / 255, green: 96 / 255, blue: 20 / 255, alpha: 1)
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(UIColor.custonBlue, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    private func hideNavigationItemBackground() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .label
    }
}

extension UIColor {
    static var custonBlue: UIColor {
        return UIColor(red: 52 / 255, green: 63 / 255, blue: 86 / 255, alpha: 1)
    }
}
