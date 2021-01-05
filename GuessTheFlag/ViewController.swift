//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Giovanna Pezzini on 04/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var button1 = FlagButton()
    var button2 = FlagButton()
    var button3 = FlagButton()
    
    var countries = [String]()
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        configureButtons()
    }
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries.randomElement()!), for: .normal)
        button2.setImage(UIImage(named: countries.randomElement()!), for: .normal)
        button3.setImage(UIImage(named: countries.randomElement()!), for: .normal)
    }
    
    func configureButtons() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        button1.addShadow(to: button1)
        button2.addShadow(to: button2)
        button3.addShadow(to: button3)

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
            
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20)
        ])
    }
}

