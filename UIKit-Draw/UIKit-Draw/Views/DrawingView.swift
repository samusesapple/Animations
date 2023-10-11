//
//  DrawingView.swift
//  UIKit-Draw
//
//  Created by dev on 2023/10/10.
//

import UIKit

final class DrawingView: UIView {
    
    private var points: [CGPoint]
    
    private var lineColor: UIColor
    
    // MARK: - Initializer
    
    init(frame: CGRect, points: [CGPoint], color: UIColor = .black) {
        self.points = points
        self.lineColor = color
        super.init(frame: frame)

        self.backgroundColor = .white
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        drawBezierPath(path: path, frame: self.frame, color: lineColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func drawBezierPath(path: UIBezierPath, frame: CGRect, color: UIColor) {
        path.lineWidth = 3
        path.lineJoinStyle = .round
        path.usesEvenOddFillRule = true
        
        path.move(to: CGPoint(x: points[0].x, y: points[0].y))
        
        points.forEach { path.addLine(to: $0) }

        lineColor.set()
        path.stroke()
    }
}
