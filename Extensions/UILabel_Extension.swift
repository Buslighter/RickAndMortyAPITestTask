//
//  UILabel_Extension.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 08.08.2022.
//

import UIKit

extension UILabel {

    convenience init(text: String = "", font: UIFont?) {
        self.init()

        self.text = text
        self.font = font
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .left

    }
}
