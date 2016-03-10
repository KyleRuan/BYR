//
//  FeedMediaCell.swift
//  Yep
//
//  Created by nixzhu on 15/9/30.
//  Copyright © 2015年 Catch Inc. All rights reserved.
//

import UIKit

class FeedMediaCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        //        static let backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        imageView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        imageView.layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
//        return UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        imageView.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).CGColor
        
        contentView.backgroundColor = UIColor.clearColor()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView.image = nil
    }

    func configureWithImage(image: UIImage) {

        imageView.image = image
        deleteImageView.hidden = false
    }

//    func configureWithAttachment(attachment: DiscoveredAttachment, bigger: Bool) {
//
//        if attachment.isTemporary {
//            imageView.image = attachment.image
//
//        } else {
//            let size = bigger ? feedAttachmentBiggerImageSize : feedAttachmentImageSize
//
//            imageView.yep_showActivityIndicatorWhenLoading = true
//            imageView.yep_setImageOfAttachment(attachment, withSize: size)
//        }
//
//        deleteImageView.hidden = true
//    }
}
