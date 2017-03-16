//
//  HomeViewController.swift
//  FakeYouTuBe
//
//  Created by Kien Nguyen Dang on 3/12/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    @IBOutlet weak var viewMenuBar: UIView!
    let listIConTabbar = ["HomeIcon", "TrendingIcon", "ListIcon", "ProfileIcon"]
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        navigationItem.title = "HomeIcon"
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCell")
        collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        menuBarCollectionView.delegate = self
        menuBarCollectionView.dataSource = self
        menuBarCollectionView.register(UINib.init(nibName: "MenuBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellMenuBar")
        
        let selectedIndexPath = NSIndexPath(row: 0, section: 0)
        menuBarCollectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.menuBarCollectionView{
            return 4
        }else{
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuBarCollectionView{
            let cellMenuBar = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMenuBar", for: indexPath) as! MenuBarCollectionViewCell
            cellMenuBar.imageIconMenu.image = UIImage(named: listIConTabbar[indexPath.item])?.withRenderingMode(.alwaysTemplate)
            cellMenuBar.tintColor = UIColor.darkGray
            return cellMenuBar
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView{
            let height = (self.view.frame.width - 32) * (9 / 16)
            return CGSize(width: self.view.frame.width, height: height + 16 + 69)
        }else{
            return CGSize(width: self.viewMenuBar.bounds.width / 4, height: self.viewMenuBar.bounds.height)
        }
    }
}
