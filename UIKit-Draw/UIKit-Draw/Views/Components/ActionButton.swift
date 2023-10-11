//
//  ActionButton.swift
//  UIKit-Draw
//
//  Created by dev on 2023/10/11.
//

import UIKit

final class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.tintColor = .white
        self.backgroundColor = .blue
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
}
