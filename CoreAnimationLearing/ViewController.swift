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

    var colorLayer:CALayer!
    var shapeLayer:CAShapeLayer!
    var isGraphViewShowing = true
    
    @IBOutlet weak var addButton: PushButtonView!
    @IBOutlet weak var reduceButton: PushButtonView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var graphView: GraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addButtonAction(sender: PushButtonView) {
        if sender.isAddButton
        {
            counterView.counterNum  += 1
        }
        else
        {
            counterView.counterNum -= 1
        }
        counterLabel.text = String(counterView.counterNum)
    }
    
    @IBAction func couterViewTap(sender: AnyObject) {
        
        if (isGraphViewShowing)
        {
                UIView.transitionFromView(graphView, toView: counterView, duration: 1.0, options: [UIViewAnimationOptions.TransitionFlipFromLeft , UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
        }
        else
        {
            UIView.transitionFromView(counterView, toView: graphView, duration: 1.0, options:[UIViewAnimationOptions.TransitionFlipFromRight,UIViewAnimationOptions.ShowHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

