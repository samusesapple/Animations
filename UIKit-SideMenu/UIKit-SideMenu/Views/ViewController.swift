//
//  ViewController.swift
//  UIKit-SideMenu
//
//  Created by Sam Sung on 2023/10/10.
//

import UIKit

final class ViewController: UIViewController {

// MARK: - Properties
    
    // Top Menu Constraints
    private lazy var topMenuBottomAnchor = topMenuView.bottomAnchor.constraint(equalTo: view.topAnchor) // closed
    private lazy var topMenuTopAnchor = topMenuView.topAnchor.constraint(equalTo: view.topAnchor) // opened
    
    // Left Menu Constraints
    private lazy var leftMenuLeadingAnchor = leftMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor) // closed
    private lazy var leftMenuTrailingAnchor = leftMenuView.trailingAnchor.constraint(equalTo:  view.leadingAnchor) // opened
    
    // Right Menu Constraints
    private lazy var rightMenuLeadingAnchor = rightMenuView.leadingAnchor.constraint(equalTo: view.trailingAnchor) // closed
    private lazy var rightMenuTrailingAnchor = rightMenuView.trailingAnchor.constraint(equalTo:  view.trailingAnchor) // opened
    
    // Bottom Menu Constraints
    private lazy var bottomMenuTopAnchor = bottomMenuView.topAnchor.constraint(equalTo: view.bottomAnchor) // closed
    private lazy var bottomMenuBottomAnchor = bottomMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // opened
    
    
    // Menu Status
    private var topMenuIsOpened: Bool = false {
        didSet {
            resetMenuConstraints(status: topMenuIsOpened, menu: .top)
        }
    }
    
    private var leftMenuIsOpened: Bool = false {
        didSet {
            resetMenuConstraints(status: leftMenuIsOpened, menu: .left)
        }
    }
    
    private var rightMenuIsOpened: Bool = false {
        didSet {
            resetMenuConstraints(status: rightMenuIsOpened, menu: .right)
        }
    }
    
    private var bottomMenuIsOpened: Bool = false {
        didSet {
            resetMenuConstraints(status: bottomMenuIsOpened, menu: .bottom)
        }
    }
    
// MARK: - Components
    // Menus
    private var topMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var leftMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var rightMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private var bottomMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    // Buttons
    private var topMenuButton: OpenMenuButton = {
        let button = OpenMenuButton(type: .system)
        button.setMenuTitle(style: .top)
        return button
    }()
    
    private var leftMenuButton: OpenMenuButton = {
        let button = OpenMenuButton(type: .system)
        button.setMenuTitle(style: .left)
        return button
    }()
    
    private var rightMenuButton: OpenMenuButton = {
        let button = OpenMenuButton(type: .system)
        button.setMenuTitle(style: .right)
        return button
    }()
    
    private var bottomMenuButton: OpenMenuButton = {
        let button = OpenMenuButton(type: .system)
        button.setMenuTitle(style: .bottom)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [topMenuButton, leftMenuButton, rightMenuButton, bottomMenuButton])
        sv.axis = .vertical
        sv.spacing = 14
        sv.distribution = .fillEqually
        sv.alignment = .fill
        return sv
    }()
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addButtonActions()
    }

// MARK: - Actions
    @objc private func topMenuButtonDidTapped() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.topMenuIsOpened.toggle()
        }
    }
    
    @objc private func leftMenuButtonDidTapped() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.leftMenuIsOpened.toggle()
        }
    }
    
    @objc private func rightMenuButtonDidTapped() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.rightMenuIsOpened.toggle()
        }
    }
    
    @objc private func bottomMenuButtonDidTapped() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.bottomMenuIsOpened.toggle()
        }
    }
    
    private func resetMenuConstraints(status isOpened: Bool, menu: MenuStyle) {
        isOpened ? openMenu(menu: menu) : closeMenu(menu: menu)
        view.layoutIfNeeded()
    }
    
// MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        setAutolayout()
    }

    private func setAutolayout() {
        [topMenuView, leftMenuView, rightMenuView, bottomMenuView,
         buttonsStackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    // Menus
        // top
        topMenuView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topMenuBottomAnchor.isActive = true // default - closed
        topMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // left
        leftMenuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftMenuTrailingAnchor.isActive = true // default - closed
        leftMenuView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // right
        rightMenuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightMenuLeadingAnchor.isActive = true // default - closed
        rightMenuView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // bottom
        bottomMenuView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        bottomMenuTopAnchor.isActive = true // default - closed
        bottomMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomMenuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    // Buttons Stack
        buttonsStackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: (45 * 4) + (14 * 3)).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func addButtonActions() {
        topMenuButton.addTarget(self, action: #selector(topMenuButtonDidTapped), for: .touchUpInside)
        leftMenuButton.addTarget(self, action: #selector(leftMenuButtonDidTapped), for: .touchUpInside)
        rightMenuButton.addTarget(self, action: #selector(rightMenuButtonDidTapped), for: .touchUpInside)
        bottomMenuButton.addTarget(self, action: #selector(bottomMenuButtonDidTapped), for: .touchUpInside)
    }
    
    private func openMenu(menu style: MenuStyle) {
        switch style {
        case .left:
            leftMenuTrailingAnchor.isActive = false
            leftMenuLeadingAnchor.isActive = true
            
        case .right:
            rightMenuLeadingAnchor.isActive = false
            rightMenuTrailingAnchor.isActive = true
            
        case .bottom:
            bottomMenuTopAnchor.isActive = false
            bottomMenuBottomAnchor.isActive = true
            
        case .top:
            topMenuBottomAnchor.isActive = false
            topMenuTopAnchor.isActive = true
        }
    }
    
    private func closeMenu(menu style: MenuStyle) {
        switch style {
        case .left:
            leftMenuLeadingAnchor.isActive = false
            leftMenuTrailingAnchor.isActive = true
            
        case .right:
            rightMenuTrailingAnchor.isActive = false
            rightMenuLeadingAnchor.isActive = true
            
        case .bottom:
            bottomMenuBottomAnchor.isActive = false
            bottomMenuTopAnchor.isActive = true
            
        case .top:
            topMenuTopAnchor.isActive = false
            topMenuBottomAnchor.isActive = true
        }
    }
}

