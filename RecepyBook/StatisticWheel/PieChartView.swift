//
//  PieChartView.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-29.



import UIKit

class PieChartView: UIView {
    
    var dataEntries: [PieChartDataEntry] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawPieChart()
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .clear // Set the background color to clear
    }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.backgroundColor = .clear // Set the background color to clear
    }
    
    private func drawPieChart() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let totalValue = dataEntries.reduce(0) { $0 + $1.value }
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2
        let lineWidth: CGFloat = 20 // Set the desired thickness of the ring

        var startAngle = -CGFloat.pi // Start from the left side (9 o'clock)

        for entry in dataEntries {
            let endAngle = startAngle + 2 * .pi * (entry.value / totalValue)

            // Create a shape layer for the arc (ring)
            let arcLayer = CAShapeLayer()
            arcLayer.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
            arcLayer.strokeColor = entry.color.cgColor
            arcLayer.fillColor = UIColor.clear.cgColor
            arcLayer.lineWidth = lineWidth

            layer.addSublayer(arcLayer)

            startAngle = endAngle
        }
    }
    
//    private func drawPieChart() {
//            layer.sublayers?.forEach { $0.removeFromSuperlayer() }
//
//            let totalValue = dataEntries.reduce(0) { $0 + $1.value }
//            let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
//            let radius = min(bounds.width, bounds.height) / 2
//            let lineWidth: CGFloat = 5 // Set the desired thickness of the ring
//
//            var startAngle = -CGFloat.pi / 2 // Start from the bottom (6 o'clock)
//            var currentZPosition: CGFloat = 0
//
//            for entry in dataEntries.reversed() {
//                let endAngle = startAngle + 2 * .pi * (entry.value / totalValue)
//
//                // Calculate height based on the value of the segment
//                let heightMultiplier = entry.value / totalValue
//                let height: CGFloat = 0// Adjust the height scale as needed
//
//                // Create a path for the segment
//                let path = UIBezierPath()
//                path.move(to: center)
//                path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//                path.close()
//
//                // Apply 3D effect using Core Graphics transformations
//                let context = UIGraphicsGetCurrentContext()!
//                context.saveGState()
//
//                // Translate to the center of the pie chart
//                context.translateBy(x: center.x, y: center.y)
//
//                // Apply rotation along the Y-axis (tilt along the side)
//                let tiltAngle: CGFloat = -45 // Set the desired tilt angle
//                context.rotate(by: tiltAngle * .pi / 180)
//
//                // Translate back to the original position
//                context.translateBy(x: -center.x, y: -center.y)
//
//                // Apply translation for height
//                let translation = CGAffineTransform(translationX: 0, y: -height)
//                path.apply(translation)
//
//                // Draw the segment path with the color
//                entry.color.setFill()
//                path.fill()
//
//                // Draw the segment border
//                UIColor.black.setStroke()
//                path.lineWidth = lineWidth
//                path.stroke()
//
//                context.restoreGState()
//
//                currentZPosition += 1
//                startAngle = endAngle
//            }
//        }





}
