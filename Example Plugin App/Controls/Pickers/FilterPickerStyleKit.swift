//
//  FilterPickerStyleKit.swift
//  AKSynthOne
//
//  Created by Matthew Fecher on 10/4/18.
//  Copyright © 2018 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

import UIKit

public class FilterPickerStyleKit: NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawFilterIcons(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 42, height: 165), resizing: ResizingBehavior = .aspectFit, controlValue: CGFloat = 3) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 42, height: 165), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 42, y: resizedFrame.height / 165)

        //// Color Declarations
        let selected = UIColor(red: 0.537, green: 0.898, blue: 0.976, alpha: 1.000)
        let unselected = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1.000)

        //// Variable Declarations
        let color1 = controlValue == 1 ? selected : unselected
        let color2 = controlValue == 2 ? selected : unselected
        let color3 = controlValue == 3 ? selected : unselected

        //// lFOWaveformPicker-square_1_ Drawing
        let lFOWaveformPickersquare_1_Path = UIBezierPath()
        lFOWaveformPickersquare_1_Path.move(to: CGPoint(x: 10, y: 32))
        lFOWaveformPickersquare_1_Path.addLine(to: CGPoint(x: 10, y: 16))
        lFOWaveformPickersquare_1_Path.addLine(to: CGPoint(x: 20.34, y: 16))
        lFOWaveformPickersquare_1_Path.addLine(to: CGPoint(x: 32, y: 32))
        color1.setStroke()
        lFOWaveformPickersquare_1_Path.lineWidth = 2.5
        lFOWaveformPickersquare_1_Path.lineCapStyle = .round
        lFOWaveformPickersquare_1_Path.stroke()

        //// lFOWaveformPicker-square_2_ Drawing
        let lFOWaveformPickersquare_2_Path = UIBezierPath()
        lFOWaveformPickersquare_2_Path.move(to: CGPoint(x: 10, y: 91))
        lFOWaveformPickersquare_2_Path.addLine(to: CGPoint(x: 21.66, y: 75))
        lFOWaveformPickersquare_2_Path.addLine(to: CGPoint(x: 32, y: 75))
        lFOWaveformPickersquare_2_Path.addLine(to: CGPoint(x: 32, y: 91))
        color2.setStroke()
        lFOWaveformPickersquare_2_Path.lineWidth = 2.5
        lFOWaveformPickersquare_2_Path.lineCapStyle = .round
        lFOWaveformPickersquare_2_Path.stroke()

        //// lFOWaveformPicker-sineWave_1_ Drawing
        let lFOWaveformPickersineWave_1_Path = UIBezierPath()
        lFOWaveformPickersineWave_1_Path.move(to: CGPoint(x: 20.5, y: 127))
        lFOWaveformPickersineWave_1_Path.addCurve(to: CGPoint(x: 30.76, y: 143), controlPoint1: CGPoint(x: 28.72, y: 127), controlPoint2: CGPoint(x: 24.58, y: 143))
        lFOWaveformPickersineWave_1_Path.addLine(to: CGPoint(x: 31.78, y: 143))
        lFOWaveformPickersineWave_1_Path.addLine(to: CGPoint(x: 35, y: 143))
        lFOWaveformPickersineWave_1_Path.move(to: CGPoint(x: 6, y: 143))
        lFOWaveformPickersineWave_1_Path.addLine(to: CGPoint(x: 9.22, y: 143))
        lFOWaveformPickersineWave_1_Path.addLine(to: CGPoint(x: 10.24, y: 143))
        lFOWaveformPickersineWave_1_Path.addCurve(to: CGPoint(x: 20.5, y: 127), controlPoint1: CGPoint(x: 16.42, y: 143), controlPoint2: CGPoint(x: 12.28, y: 127))
        color3.setStroke()
        lFOWaveformPickersineWave_1_Path.lineWidth = 2.5
        lFOWaveformPickersineWave_1_Path.lineCapStyle = .round
        lFOWaveformPickersineWave_1_Path.stroke()

        context.restoreGState()

    }

    @objc(FilterPickerStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
