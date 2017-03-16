//
//  HomeCollectionViewCell.swift
//  FakeYouTuBe
//
//  Created by Kien Nguyen Dang on 3/12/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageThumnail: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageProfile.layer.masksToBounds = true
        //video = Video()
    }

}
