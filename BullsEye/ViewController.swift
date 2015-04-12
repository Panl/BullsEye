//
//  ViewController.swift
//  BullsEye
//
//  Created by FIND.ME on 15/4/10.
//  Copyright (c) 2015年 smarter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
    var currentValue:Int = 50
    var targetValue:Int = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
      
        var points = 100 - difference
        
        var title: String
        if difference == 0{
            title = "Perfect!!!"
            points += 100
        }else if difference < 5{
            title = "Great!!!"
            if difference == 1{
                points += 50
            }
        }else if difference < 10{
            title = "Good!!!"
        }else {
            title = "SillyB!!!"
        }
        score += points
        
        let message = "大侠，您的得分是：\(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
        action in self.startNewRound()
            self.updateLabels()})
        
        alert.addAction(action)
        presentViewController(alert,animated: true,completion:nil)
       
    }
    
    @IBAction func sliderMoved(slider:UISlider){
        //println("滑动条的当前数值是：\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue=50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreText.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
        
    
    @IBAction func startOver(sender: AnyObject) {
        startNewGame()
        updateLabels()
    }

}

