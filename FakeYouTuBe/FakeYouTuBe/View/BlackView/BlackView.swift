//
//  BlackView.swift
//  FakeYouTuBe
//
//  Created by Nguyen Dang Kien on 3/21/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class BlackView: UIView{
    var settingView: SettingView?
    override func awakeFromNib() {
    }
    func handleMore() {
        
        
        if let window = UIApplication.shared.keyWindow{
            self.backgroundColor = UIColor(white: 0, alpha: 0.5)
            self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(self)
            settingView = SettingView(frame: window.frame)
            window.addSubview(settingView!)
            self.frame = window.frame
            self.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                let height: CGFloat = 200
                let y = window.frame.height - height
                self.alpha = 1
                self.settingView?.frame = CGRect(x: 0, y: y, width: (self.settingView?.frame.width)!, height: (self.settingView?.frame.height)!)
            }, completion: nil)
        }
    }
    func handleDismiss() {
        UIView.animate(withDuration: 0.5){
            self.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.settingView?.frame = CGRect(x: 0, y: window.frame.height, width: (self.settingView?.frame.width)!, height: (self.settingView?.frame.height)!)
            }
        }
    }
}
