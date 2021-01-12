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
    var scoreLabel = UILabel()
    var correctAnswer = 0
    var numberOfQuestionsAsked = 0
    
    var score: Int = 0 {
        didSet {
            navigationItem.rightBarButtonItem?.title = "Score: \(score)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        configureNavBar()
        configureButtons()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        numberOfQuestionsAsked += 1
        if numberOfQuestionsAsked > 10 { finalAlert() }
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        button2.tag = 1
        button3.tag = 2
        
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String

        if sender.tag == correctAnswer {
            title = "Correct"
            message = "1 point for \(countries[sender.tag].capitalizingFirstLetter())! 🎉"
            score += 1
        } else {
            title = "Wrong"
            message = "That's the flag of \(countries[sender.tag].capitalizingFirstLetter()) 🤭"
            score -= 1
        }
                
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.isUserInteractionEnabled = false

        let scoreItem = UIBarButtonItem(title: "Score: \(score)", style: .plain, target: self, action: nil)
        scoreItem.tintColor = .secondaryLabel
        navigationItem.rightBarButtonItem = scoreItem
    }
    
    func finalAlert() {
        let ac = UIAlertController(title: "End of Game 🎬", message: "You got \(score) out of 10", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        score = 0
        numberOfQuestionsAsked = 0
    }
    
    func configureButtons() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)

        NSLayoutConstraint.activate([
            button1.heightAnchor.constraint(equalTo: button1.widthAnchor, multiplier: 1.0/2.0),
            button2.heightAnchor.constraint(equalTo: button2.widthAnchor, multiplier: 1.0/2.0),
            button3.heightAnchor.constraint(equalTo: button3.widthAnchor, multiplier: 1.0/2.0),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.heightAnchor.constraint(equalTo: button1.heightAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.heightAnchor.constraint(equalTo: button1.heightAnchor),
            button3.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
    }
}

