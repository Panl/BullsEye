//
//  AboutViewController.swift
//  BullsEye
//
//  Created by FIND.ME on 15/4/11.
//  Copyright (c) 2015年 smarter. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
