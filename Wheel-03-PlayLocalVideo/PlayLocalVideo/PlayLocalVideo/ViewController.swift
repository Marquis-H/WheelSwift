//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by marquis on 16/2/26.
//  Copyright © 2016年 marquis. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoTableView: UITableView!
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    /**
     Description
     
     - parameter sender: sender description
     */
    @IBAction func playVideoBtnDidTouch(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("emoji-zone", ofType: "mp4")
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) { () -> Void in
            self.playViewController.player?.play()
        }
    }
    /**
     <#Description#>
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     <#Description#>
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    /**
     <#Description#>
     
     - parameter tableView: <#tableView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    /**
     <#Description#>
     
     - parameter tableView: <#tableView description#>
     - parameter section:   <#section description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    /**
     <#Description#>
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoImg.image = UIImage(named: video.image)
        cell.videoTitle.text = video.title
        cell.videoSource.text = video.source
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

