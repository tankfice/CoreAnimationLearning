//
//  ViewController.swift
//  CoreAnimationLearing
//
//  Created by 汤清欢 on 16/3/2.
//  Copyright © 2016年 汤清欢. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.size.width

class ViewController: UIViewController {

    var circleLayer:CAShapeLayer!
    var timer:NSTimer?
    var progress:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleLayer = CAShapeLayer.init();
        circleLayer.frame  = CGRectMake(100, 100, 95, 95)
        circleLayer.position = self.view.center
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.lineWidth = 5
        circleLayer.strokeColor = UIColor.redColor().CGColor
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateCireleLayer", userInfo: nil, repeats: true)
        
        let leftLayer = CAGradientLayer.init()
        leftLayer.frame = CGRectMake(screenWidth / 2 - 50, circleLayer.frame.origin.y, 50, 100)
        leftLayer.locations = [0.3,0.9,1]
        leftLayer.colors = [UIColor.greenColor().CGColor,UIColor.redColor().CGColor]
        
        let rightLayer = CAGradientLayer.init()
        rightLayer.frame = CGRectMake(screenWidth / 2, circleLayer.frame.origin.y, 50, 100)
        rightLayer.locations = [0.3,0.9,1]
        rightLayer.colors = [UIColor.yellowColor().CGColor,UIColor.redColor().CGColor]
        
        let containerLayer = CAGradientLayer.init()
        containerLayer.addSublayer(leftLayer)
        containerLayer.addSublayer(rightLayer)
        containerLayer.mask = circleLayer
        
        self.view.layer.addSublayer(containerLayer)
//        self.view.layer.addSublayer(circleLayer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func updateCireleLayer()
    {

        let endAngle = -M_PI_2 + progress * 2 * M_PI
        let theBeziPath  = UIBezierPath.init(arcCenter: CGPointMake(50, 50), radius: 42.5, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(endAngle), clockwise: true)
        if endAngle >= Double(2 * M_PI)
        {
            progress = 0;
        }
        circleLayer.path = theBeziPath.CGPath
        progress += 0.01
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

