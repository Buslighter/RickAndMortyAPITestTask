//
//  UI_Extension.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 08.08.2022.
//

import UIKit

extension UITableView {

    convenience init(rowHeight: CGFloat) {
        self.init()
        self.rowHeight = rowHeight
        self.separatorStyle = .singleLine
        self.delaysContentTouches = true
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
