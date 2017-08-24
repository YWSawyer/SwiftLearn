//
//  ViewController.swift
//  TouchTest
//
//  Created by wei.yuan on 1/27/16.
//  Copyright © 2016 wei.yuan. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        NSLog("ContainerView is clicked...")
        for subview: UIView in self.subviews {
            print("subviews count is :\(subviews.count)")
            if let btn = subview as? UIButton {
                if btn.tag == 200 {
                    let btnPoint: CGPoint = btn.convert(point, from: self)
                    if btn.point(inside: btnPoint, with: event) {
                        return btn
                    }
                }
            }
        }
        return super.hitTest(point, with: event)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("Container touchesBegan activity ...")
        next?.touchesBegan(touches, with: event)
    }
}
class ViewB: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("viewB is clicked ...")
        next?.touchesBegan(touches, with: event)
    }
}

class ViewA: UIView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("viewA is clicked ...")
        next?.touchesBegan(touches, with: event)
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let containerView: ContainerView = ContainerView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = UIColor.green
        self.view.addSubview(containerView)
        
        
        
        let btnA: UIButton = UIButton(type: UIButtonType.custom)
        btnA.frame = CGRect(x: 70, y: 100, width: 150, height: 80)
        btnA.backgroundColor = UIColor.gray
        btnA.tag = 200
        btnA.addTarget(self, action: #selector(ViewController.btnAAction(_:)), for: UIControlEvents.touchUpInside)
        containerView.addSubview(btnA)
        
        let viewA: ViewA = ViewA(frame: CGRect(x: 60, y: 120, width: 280, height: 400))
        viewA.backgroundColor = UIColor.lightGray
        containerView.addSubview(viewA)
        
        let viewB: ViewB = ViewB(frame: CGRect(x: 20, y: 150, width: 200, height: 200))
        viewB.backgroundColor = UIColor.blue
        viewB.isUserInteractionEnabled = true
        viewA.addSubview(viewB)
        
        let btnB: UIButton = UIButton(type: UIButtonType.custom)
        btnB.frame = CGRect(x: 20, y: 20, width: 150, height: 80)
        btnB.tag = 300
        btnB.backgroundColor = UIColor.brown
        btnB.addTarget(self, action: #selector(ViewController.btnBAction(_:)), for: UIControlEvents.touchUpInside)
        viewB.addSubview(btnB)
        
    
        
        
        
        
    }
  
    func btnAAction(_ btn: UIButton) {
        NSLog("btnA is clicked ...")
    }
    
    func btnBAction(_ btn: UIButton) {
        NSLog("btnB is clicked...")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("ViewController is clicked...")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

