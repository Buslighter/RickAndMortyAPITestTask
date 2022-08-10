//
//  UIButton_LauchScreen_Extension.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 09.08.2022.
//

import UIKit

extension UIButton {

    convenience init(text: String = "") {
        self.init()
        self.backgroundColor = .clear
        self.titleLabel?.text = text
        self.titleLabel?.textColor = .black
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    func makeButtonClicked(){
        UIView.animate(withDuration: 0.3, delay: 0, animations: {
            self.backgroundColor = .orange
        })
    }
}
