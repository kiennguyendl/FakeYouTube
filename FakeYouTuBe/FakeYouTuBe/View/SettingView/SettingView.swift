//
//  SettingView.swift
//  FakeYouTuBe
//
//  Created by Nguyen Dang Kien on 3/22/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class SettingView: UIView, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var settingCollectionView: UICollectionView!
    @IBOutlet weak var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        let height: CGFloat = 200
        //let y = frame.height - height
        self.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        self.backgroundColor = UIColor.white
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        //nibSetup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    private func nibSetup() {
        if let view = loadViewFromNib() {
            view.frame = self.bounds
            
            view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            view.translatesAutoresizingMaskIntoConstraints = true
            self.view = view
            self.addSubview(self.view!)
            settingCollectionView.dataSource = self
            settingCollectionView.delegate = self
            settingCollectionView.register(UINib(nibName: "SettingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        }
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return nibView
    }
}

extension SettingView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SettingCollectionViewCell
        return cell
    }
}
