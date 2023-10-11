//
//  DrawingViewController.swift
//  UIKit-Draw
//
//  Created by dev on 2023/10/11.
//

import UIKit

final class DrawingViewController: UIViewController {

    private var drawingView: DrawingView
    
    // MARK: - Lifecycle
    
    init(drawingView: DrawingView) {
        self.drawingView = drawingView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = drawingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
