//
//  ViewController.swift
//  StopWatch
//
//  Created by marquis on 16/2/19.
//  Copyright © 2016年 marquis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    var count = 0.0
    var Timer = NSTimer()
    var isPlay = false
    
    override func viewDidLoad() {
        timeLabel.text = String(count)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetTime(sender: AnyObject) {
        Timer.invalidate()
        isPlay = false
        count = 0.0
        timeLabel.text = String(count)
    }
    
    @IBAction func playTime(sender: AnyObject) {
        if(isPlay){
            return
        }
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer:"), userInfo: nil, repeats: true)
        isPlay = true
    }
    
    @IBAction func pauseTime(sender: AnyObject) {
        Timer.invalidate()
        isPlay = false
    }
    
    func UpdateTimer(t:NSTimer){
        count += 0.1
        timeLabel.text = String(format: "%.1f",count)
    }
    

}

