//
//  ViewController.swift
//  CustomFont
//
//  Created by marquis on 16/2/25.
//  Copyright © 2016年 marquis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", ""]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontBtn: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBAction func changeFontDidTouch(sender: AnyObject) {
        fontRowIndex = (fontRowIndex+1) % 3
        fontTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for family in UIFont.familyNames(){
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size: 16)

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

