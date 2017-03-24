//
//  SettingCollectionViewCell.swift
//  FakeYouTuBe
//
//  Created by kienND9 on 3/23/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageSetting: UIImageView!

    @IBOutlet weak var titleSetting: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isHighlighted: Bool{
        didSet{
            self.backgroundColor = isHighlighted ? UIColor.white : UIColor.darkGray
            self.titleSetting.textColor = isHighlighted ? UIColor.white : UIColor.black
            self.imageSetting.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var settingLauche: Setting? {
        didSet{
            titleSetting.text = self.settingLauche?.name
            if let image = settingLauche?.image{
                imageSetting.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
                imageSetting.tintColor = UIColor.darkGray
            }
        }
    }

    
}
