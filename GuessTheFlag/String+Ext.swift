//
//  String+Ext.swift
//  GuessTheFlag
//
//  Created by Giovanna Pezzini on 05/01/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
