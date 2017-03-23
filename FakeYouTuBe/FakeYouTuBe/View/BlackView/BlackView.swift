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
    
//    let settings: [Setting] = {
//        
//        return [Setting(name: "Setting", image: "setting"),
//                Setting(name: "Tearm and privacy policy", image: "private"),
//                Setting(name: "Send Feedback", image: "feedback"),
//                Setting(name: "Help", image: "help"),
//                Setting(name: "Switch account", image: "ProfileIcon"),
//                Setting(name: "Cancel", image: "cancel")]
//    }()
    
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
                let height: CGFloat = CGFloat(settings.count * 50)
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
