//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Giovanna Pezzini on 04/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureButtons()
    }
    
    func configureButtons() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        button1.backgroundColor = .systemPink
        button2.backgroundColor = .systemPink
        button3.backgroundColor = .systemPink
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 100),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20)
        ])
    }
}

