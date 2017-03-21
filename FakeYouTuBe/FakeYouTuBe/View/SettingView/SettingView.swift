//
//  SettingView.swift
//  FakeYouTuBe
//
//  Created by Nguyen Dang Kien on 3/22/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class SettingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let height: CGFloat = 200
        //let y = frame.height - height
        self.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
