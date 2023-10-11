//
//  ViewController.swift
//  UIKit-Draw
//
//  Created by Sam Sung on 2023/10/10.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var shouldPresentPointLineView: Bool = false {
        didSet {
            shouldPresentPointLineView ? presentDrawingView() : resetPoints()
        }
    }
    
    private var points: [CGPoint] = []
    
    // MARK: - Components
    
    private var pointsButton: UIButton = {
        let button = ActionButton(type: .system)
        button.setTitle("Points")
        return button
    }()
    
    private var sketchButton: UIButton = {
        let button = ActionButton(type: .system)
        button.setTitle("Sketch")
        return button
    }()
    
    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setButtonActions()
        addTapGesture()
    }
    
    // MARK: - Actions
    
    private func setButtonActions() {
        pointsButton.addTarget(self, action: #selector(pushPointLine), for: .touchUpInside)
        sketchButton.addTarget(self, action: #selector(pushSketchViewController), for: .touchUpInside)
    }
    
    @objc private func pushPointLine() {
        guard points.count >= 3 else { return } // won't draw shape if points are less then 3
        shouldPresentPointLineView.toggle()
    }
    
    @objc private func pushSketchViewController() {
        
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.title = "Main"
        setAutolayout()
    }
    
    private func setAutolayout() {
        [pointsButton, sketchButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        pointsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pointsButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        pointsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pointsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        
        sketchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sketchButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        sketchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sketchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +30).isActive = true
    }
    
    private func presentDrawingView() {
        let drawingView = DrawingView(frame: CGRect(x: 0, y: 0,
                                                    width: view.frame.width,
                                                    height: 300),
                                      points: points,
                                      color: .black)
        let drawingViewController = DrawingViewController(drawingView: drawingView)
        
        shouldPresentPointLineView.toggle() // make it false
        
        self.navigationController?.pushViewController(drawingViewController, animated: true)
    }
    
    private func resetPoints() {
        self.points = []
    }
}

// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addNewPoint(sender:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func addNewPoint(sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: self.view)
        points.append(touchPoint)
        print(points)
    }
}

