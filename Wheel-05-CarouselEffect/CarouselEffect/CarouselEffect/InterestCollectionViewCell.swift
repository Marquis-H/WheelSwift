//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by marquis on 16/3/3.
//  Copyright © 2016年 marquis. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!

    @IBOutlet weak var photoTitleLabel: UILabel!
    
    var interest: Interest!{
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        photoTitleLabel?.text! = interest.title!
        photoView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
