//
//  OpenMenuButton.swift
//  UIKit-SideMenu
//
//  Created by dev on 2023/10/10.
//

import UIKit

final class OpenMenuButton: UIButton {

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
        self.tintColor = .white
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setMenuTitle(style: MenuStyle) {
        self.setTitle("Open \(style.rawValue)", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
}
