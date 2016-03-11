//
//  CounterView.swift
//  CoreAnimationLearing
//
//  Created by 汤清欢 on 16/3/10.
//  Copyright © 2016年 汤清欢. All rights reserved.
//

import UIKit
let NoOfGlasses = 8
let PI : CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {

    var counterNum : Int = 5
        {
            didSet
            {
                if counterNum <= NoOfGlasses
                {
                    setNeedsDisplay()
                }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()

    override func drawRect(rect: CGRect) {
        
        let center = CGPointMake(bounds.width / 2, bounds.height / 2)
        let radius = max(bounds.width, bounds.height)
        
        let arcWidth : CGFloat = 76
        let startAngle : CGFloat = 3 * PI / 4
        let endAngle: CGFloat = PI / 4

        let path = UIBezierPath(arcCenter: center, radius: radius / 2 - arcWidth / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * PI - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counterNum) + startAngle
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
            radius: bounds.width/2 - 2.5,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArcWithCenter(center,
            radius: bounds.width/2 - arcWidth + 2.5,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        //4 - close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }

}
