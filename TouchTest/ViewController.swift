//
//  ViewController.swift
//  TouchTest
//
//  Created by wei.yuan on 1/27/16.
//  Copyright © 2016 wei.yuan. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        NSLog("ContainerView is clicked...")
        for subview: UIView in self.subviews {
//            print("subviews count is :\(subviews.count)")
            if let btn = subview as? UIButton {
                if btn.tag == 200 {
                    let btnPoint: CGPoint = btn.convertPoint(point, fromView: self)
                    if btn.pointInside(btnPoint, withEvent: event) {
                        return btn
                    }
                }
            }
        }
        return super.hitTest(point, withEvent: event)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("Container touchesBegan activity ...")
        nextResponder()?.touchesBegan(touches, withEvent: event)
    }
}
class ViewB: UIView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("viewB is clicked ...")
        nextResponder()?.touchesBegan(touches, withEvent: event)
    }
}

class ViewA: UIView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("viewA is clicked ...")
        nextResponder()?.touchesBegan(touches, withEvent: event)
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let containerView: ContainerView = ContainerView(frame: UIScreen.mainScreen().bounds)
        containerView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(containerView)
        
        
        
        let btnA: UIButton = UIButton(type: UIButtonType.Custom)
        btnA.frame = CGRect(x: 70, y: 100, width: 150, height: 80)
        btnA.backgroundColor = UIColor.grayColor()
        btnA.tag = 200
        btnA.addTarget(self, action: "btnAAction:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(btnA)
        
        let viewA: ViewA = ViewA(frame: CGRect(x: 20, y: 80, width: 280, height: 400))
        viewA.backgroundColor = UIColor.lightGrayColor()
        containerView.addSubview(viewA)
        
        let viewB: ViewB = ViewB(frame: CGRect(x: 20, y: 150, width: 200, height: 200))
        viewB.backgroundColor = UIColor.blueColor()
        viewB.userInteractionEnabled = true
        viewA.addSubview(viewB)
        
        let btnB: UIButton = UIButton(type: UIButtonType.Custom)
        btnB.frame = CGRectMake(20, 20, 150, 80)
        btnB.tag = 300
        btnB.backgroundColor = UIColor.brownColor()
        btnB.addTarget(self, action: "btnBAction:", forControlEvents: UIControlEvents.TouchUpInside)
        viewB.addSubview(btnB)
        
    
        
        
        
        
    }
  
    func btnAAction(btn: UIButton) {
        NSLog("btnA is clicked ...")
    }
    
    func btnBAction(btn: UIButton) {
        NSLog("btnB is clicked...")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("ViewController is clicked...")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

