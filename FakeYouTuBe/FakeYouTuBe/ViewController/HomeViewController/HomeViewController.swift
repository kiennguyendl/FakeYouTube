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
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCell")
        collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        menuBarCollectionView.delegate = self
        menuBarCollectionView.dataSource = self
        menuBarCollectionView.register(UINib.init(nibName: "MenuBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellMenuBar")
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuBarCollectionView{
            return 4
        }else{
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuBarCollectionView{
            let cellMenuBar = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMenuBar", for: indexPath) as! MenuBarCollectionViewCell
            cellMenuBar.backgroundColor = UIColor.blue
            //cellMenuBar.imageIconMenu.image = UIImage(named: "home")
            return cellMenuBar
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView{
            let height = (self.view.frame.width - 32) * (9 / 16)
            return CGSize(width: self.view.frame.width, height: height + 16 + 69)
        }else{
            return CGSize(width: self.viewMenuBar.frame.width / 4, height: self.viewMenuBar.frame.height)
        }
    }
}
