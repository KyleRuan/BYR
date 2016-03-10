//
//  FeedMediaAddCell.swift
//  Yep
//
//  Created by nixzhu on 15/9/30.
//  Copyright © 2015年 Catch Inc. All rights reserved.
//

import UIKit

class FeedMediaAddCell: UICollectionViewCell {

    @IBOutlet weak var mediaAddImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
// UIColor(red: 50/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
        mediaAddImage.tintColor = UIColor(red: 50/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)
//          return UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
        contentView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0)
    }
}
