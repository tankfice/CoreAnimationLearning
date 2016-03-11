//
//  PushButtonView.swift
//  CoreAnimationLearing
//
//  Created by 汤清欢 on 16/3/10.
//  Copyright © 2016年 汤清欢. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        path = UIBezierPath(rect: CGRectMake(self.bounds.width / 4, self.bounds.width / 2 - 2, self.bounds.width / 2, 4))
        UIColor.whiteColor().setFill()
        path.fill()
        if (isAddButton)
        {
            path = UIBezierPath(rect: CGRectMake(self.bounds.width / 2 - 2, self.bounds.width / 4, 4, self.bounds.width / 2))
            UIColor.whiteColor().setFill()
            path.fill()
        }
    }

}
