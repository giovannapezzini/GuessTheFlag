//
//  FlagButton.swift
//  GuessTheFlag
//
//  Created by Giovanna Pezzini on 04/01/21.
//

import UIKit

class FlagButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

extension UIButton {
    func addShadow(to button: UIButton) {
        let shadow = UIView()
        superview?.addSubview(shadow)

        shadow.backgroundColor = UIColor.clear
        shadow.layer.shadowColor = UIColor(red: 0.44, green: 0.56, blue: 0.69, alpha: 1.00).cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadow.layer.shadowOpacity = 0.5
        shadow.layer.shadowRadius = 8

        button.frame = shadow.bounds
        shadow.addSubview(button)
    }
}
