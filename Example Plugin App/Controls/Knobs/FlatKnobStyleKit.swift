//
//  FlatKnobStyleKit.swift
//  AudioKit
//
//  Created by Matthew Fecher on 9/19/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

import UIKit

public class FlatKnobStyleKit: NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawFlatKnob(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 130, height: 132), resizing: ResizingBehavior = .aspectFit, knobValue: CGFloat = 0.5) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 130, height: 132), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 130, y: resizedFrame.height / 132)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 130, resizedFrame.height / 132)

        //// Color Declarations
        let indicatorColor = UIColor(red: 0.855, green: 0.914, blue: 0.918, alpha: 1.000)
        let baseColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1.000)

        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = indicatorColor.withAlphaComponent(0.5 * indicatorColor.cgColor.alpha)
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 8
        let shadow2 = NSShadow()
        shadow2.shadowColor = indicatorColor.withAlphaComponent(0.5 * indicatorColor.cgColor.alpha)
        shadow2.shadowOffset = CGSize(width: 0, height: 0)
        shadow2.shadowBlurRadius = 11

        //// Variable Declarations
        let knobAngle: CGFloat = -240 * knobValue

        //// Knob
        context.saveGState()
        context.translateBy(x: 0, y: 1)

        //// GradientKnob 2 Drawing
        let gradientKnob2Path = UIBezierPath(ovalIn: CGRect(x: 13, y: 13, width: 102, height: 102))
        baseColor.setFill()
        gradientKnob2Path.fill()

        //// IndicatorGroup
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: (shadow2.shadowColor as! UIColor).cgColor)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Indicator Drawing
        context.saveGState()
        context.translateBy(x: 64, y: 64)
        context.rotate(by: -(knobAngle - 240) * CGFloat.pi/180)

        let indicatorPath = UIBezierPath(rect: CGRect(x: -3.42, y: -53.11, width: 6.95, height: 35.8))
        context.saveGState()
        context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
        indicatorColor.setFill()
        indicatorPath.fill()
        context.restoreGState()

        context.restoreGState()

        context.endTransparencyLayer()
        context.restoreGState()

        context.restoreGState()

        context.restoreGState()

    }

    @objc(FlatKnobStyleKitResizingBehavior)
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
