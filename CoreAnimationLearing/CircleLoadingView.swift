//
//  CircleLoadingView.swift
//  CoreAnimationLearing
//
//  Created by 汤清欢 on 16/3/3.
//  Copyright © 2016年 汤清欢. All rights reserved.
//

import UIKit

class CircleLoadingView:UIView {
    private var strokeColor:UIColor = UIColor.redColor()
        {
        didSet
        {
            createLayer()
        }
    }
    private var circleLayer:CAShapeLayer = CAShapeLayer.init()
    /// 在0-1之间
    var progress:CGFloat?
        {
            didSet
            {
                var endAngle = CGFloat(-M_PI_2) + progress! * CGFloat(2 * M_PI)
                if endAngle > CGFloat(2 * M_PI)
                {
                    endAngle = CGFloat(2 * M_PI)
                }
                let theBeziPath  = UIBezierPath.init(arcCenter: CGPointMake(self.bounds.width / 2, self.bounds.width / 2), radius: self.bounds.width / 2 - 2.5, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(endAngle), clockwise: true)
                circleLayer.path = theBeziPath.CGPath
                
        }
    }
    init(frame: CGRect,strokeColor:UIColor) {
        super.init(frame: frame)
        self.strokeColor = strokeColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    private func createLayer()
    {
        circleLayer = CAShapeLayer.init();
        circleLayer.frame  = self.bounds
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.lineWidth = 5
        circleLayer.strokeColor = strokeColor.CGColor
        
        let leftLayer = CAGradientLayer.init()
        leftLayer.frame = CGRectMake(0, 0, self.bounds.width / 2, self.bounds.height)
        leftLayer.locations = [0.3,0.9,1]
        leftLayer.colors = [UIColor.greenColor().CGColor,UIColor.redColor().CGColor]
        
        let rightLayer = CAGradientLayer.init()
        rightLayer.frame = CGRectMake(self.bounds.width / 2, 0, self.bounds.width / 2, self.bounds.height)
        rightLayer.locations = [0.3,0.9,1]
        rightLayer.colors = [UIColor.yellowColor().CGColor,UIColor.redColor().CGColor]
        
        let containerLayer = CAGradientLayer.init()
        containerLayer.addSublayer(leftLayer)
        containerLayer.addSublayer(rightLayer)
        containerLayer.mask = circleLayer
        self.layer .addSublayer(containerLayer)
    }
    
    
}