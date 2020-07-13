//
//  FlatToggleStyleKit.swift
//  AudioKitSynth
//
//  Created by Matthew Fecher on 9/19/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

import UIKit

public class FlatToggleStyleKit: NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawRoundButton(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 35, height: 35), resizing: ResizingBehavior = .aspectFit, isToggled: Bool = false, offColor: UIColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1.000) ) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 35, height: 35), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 35, y: resizedFrame.height / 35)

        //// Color Declarations
        let onColor = UIColor(red: 0.863, green: 1.000, blue: 0.973, alpha: 1.000)
        // let offColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1.000)

        //// Variable Declarations
        let expression = isToggled ? onColor : offColor

        //// Button
        //// buttonBackground Drawing
        let buttonBackgroundPath = UIBezierPath(ovalIn: CGRect(x: 2, y: 2, width: 30, height: 30))
        expression.setFill()
        buttonBackgroundPath.fill()

        context.restoreGState()

    }

    @objc(FlatToggleStyleKitResizingBehavior)
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
