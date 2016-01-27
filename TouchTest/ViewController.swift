//
//  ViewController.swift
//  TouchTest
//
//  Created by wei.yuan on 1/27/16.
//  Copyright © 2016 wei.yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let viewA: UIView = UIView(frame: CGRect(x: 20, y: 80, width: 280, height: 400))
        viewA.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(viewA)
        
        let btnA: UIButton = UIButton(type: UIButtonType.Custom)
        btnA.frame = CGRect(x: 70, y: 100, width: 150, height: 80)
        btnA.backgroundColor = UIColor.grayColor()
        self.view.addSubview(btnA)
        
        let viewB: UIView = UIView(frame: CGRect(x: 70, y: CGRectGetMaxY(btnA.frame)+20, width: 200, height: 200))
        viewB.backgroundColor = UIColor.blueColor()
        self.view.addSubview(viewB)
        
        let btnB: UIButton = UIButton(type: UIButtonType.Custom)
        btnB.frame = CGRectMake(20, 20, 150, 80)
        btnB.backgroundColor = UIColor.brownColor()
        viewB.addSubview(btnB)
        
    
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

