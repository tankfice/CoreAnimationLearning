//
//  GraphView.swift
//  CoreAnimationLearing
//
//  Created by 汤清欢 on 16/3/10.
//  Copyright © 2016年 汤清欢. All rights reserved.
//

import UIKit
import CoreGraphics
@IBDesignable class GraphView: UIView {

    @IBInspectable var startColor:UIColor = UIColor.redColor()
    @IBInspectable var endColor:UIColor = UIColor.greenColor()
    override func drawRect(rect: CGRect) {
        
        
        _ = rect.width
        _ = rect.height
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: UIRectCorner.AllCorners,
            cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor,endColor.CGColor]
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0,1.0]
        
        let gradient = CGGradientCreateWithColors(colorspace, colors, colorLocations)
        
        let starPoint = CGPointZero
        let endPoint = CGPointMake(0, bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, starPoint, endPoint, .DrawsBeforeStartLocation)
        
    }

}
