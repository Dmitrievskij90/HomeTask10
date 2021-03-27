//
//  ViewController.swift
//  HomeTask10.1
//
//  Created by Konstantin Dmitrievskiy on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let startButton = UIButton(type: .system)
    private let backgroundImageView = UIImageView()
    
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
        view.addSubview(startButton)
    }
    
    override func viewWillLayoutSubviews() {
        setupLayout()
    }
    
    @objc func startButtonPressed() {
        let viewController = MainViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private  func setupLayout() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background")
        
        startButton.layer.cornerRadius = 25
        startButton.backgroundColor = .systemPink
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
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




