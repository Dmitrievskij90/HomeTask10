//
//  WelcomeViewController.swift
//  HomeTask6.3
//
//  Created by Konstantin Dmitrievskiy on 27.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let startButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
        
        setupUI()
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        view.addSubview(startButton)
    }
    
    override func viewWillLayoutSubviews() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func startButtonPressed() {
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupUI() {
        startButton.backgroundColor = .red
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        startButton.layer.cornerRadius = 25
        
        navigationController?.navigationBar.tintColor = .label
    }
}
