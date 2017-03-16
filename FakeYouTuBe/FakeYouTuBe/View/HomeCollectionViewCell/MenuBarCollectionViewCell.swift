//
//  MenuBarCollectionViewCell.swift
//  FakeYouTuBe
//
//  Created by Kien Nguyen Dang on 3/14/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageIconMenu: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override var isHighlighted: Bool{
        didSet{
            imageIconMenu.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageIconMenu.tintColor = isSelected ? UIColor.white : UIColor.darkGray
        }
    }
}
