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
    
    @IBOutlet weak var lblTitleHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var lblSubTitleHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var subTitle: UILabel!
    var video: Video?{
        didSet{
            titleLabel.text = video?.title
            //imageThumnail.image = UIImage(named: (video?.thumbnailImageName)!)
            setupThumnailImage()
            setupProfileImage()
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews{
                let numberFormat = NumberFormatter()
                numberFormat.numberStyle = .decimal
                
                subTitle.text = "\(channelName) -  \(numberFormat.string(from: numberOfViews)!) - 2 years"
            }
            
//            if let profileImageName = video?.channel?.profileImageName {
//                imageProfile.image = UIImage(named: profileImageName)
//            }
            
            if let heightTextTitle = titleLabel?.intrinsicContentSize.width{
                if heightTextTitle > (titleLabel.frame.width - 10){
                    lblTitleHeightContraint.constant = 45
                }
                else{
                    lblTitleHeightContraint.constant = 20
                }
            }
            
            if let heightSubTextTitle = subTitle?.intrinsicContentSize.width{
                if heightSubTextTitle > (subTitle.frame.width - 10){
                    lblSubTitleHeightContraint.constant = 45
                }
                else{
                    lblSubTitleHeightContraint.constant = 20
                }
            }
        }
    }
    
    func setupThumnailImage() {
        if let thumnailImageURl = video?.thumbnailImageName{
            imageThumnail.loadImageFromURL(urlString: thumnailImageURl)
        }
    }
    
    func setupProfileImage()  {
        if let profileImageURl = video?.channel?.profileImageName{
            imageProfile.loadImageFromURL(urlString: profileImageURl)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        imageProfile.layer.masksToBounds = true
        imageProfile.contentMode = .scaleAspectFill
        //video = Video()
    }

}
