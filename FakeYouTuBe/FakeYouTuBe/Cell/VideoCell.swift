//
//  VideoCell.swift
//  FakeYouTuBe
//
//  Created by kienND9 on 3/1/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.backgroundColor = UIColor.purple
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    func setupView() {
        addSubview(thumnailImageView)
        addSubview(separatorView)
        addSubview(profileImageView)
        addSubview(titleLabel)
//        thumnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[imageView]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": thumnailImageView]))
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[imageView]-16-[view(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": thumnailImageView,"view": separatorView]))
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": separatorView]))
        
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": separatorView]))
        
        //horizontial
        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumnailImageView)
        addContraintsWithFormat(format: "H:|-16-[v0(44)]", views: profileImageView)
        
        //vertical
        addContraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumnailImageView, profileImageView,separatorView)
        
        addContraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addContraintsWithFormat(format: "V:[v0(20)]|", views: titleLabel)
        addContraintsWithFormat(format: "H:|[v0]|", views: titleLabel)
    }
}

extension UIView{
    func addContraintsWithFormat(format: String, views: UIView...)  {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
