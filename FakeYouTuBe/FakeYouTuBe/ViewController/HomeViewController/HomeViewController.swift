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
    
    var videos: [Video] = {
       var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor-swift"
        return [blankSpaceVideo]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingNavigation()
        settingCollectionView()
        
    }
    
    func settingCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCell")
        self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        
        self.menuBarCollectionView.delegate = self
        self.menuBarCollectionView.dataSource = self
        self.menuBarCollectionView.register(UINib.init(nibName: "MenuBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellMenuBar")
        
        let selectedIndexPath = NSIndexPath(row: 0, section: 0)
        self.menuBarCollectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    func settingNavigation() {
        self.navigationItem.title = "HomeIcon"
        self.navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        self.navigationItem.titleView = titleLabel
        
        //button search
        let searchImage = UIImage(named: "SearchIcon")?.withRenderingMode(.alwaysOriginal)
        let searchButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        
        //button  more
        let moreImage = UIImage(named: "MenuIcon")?.withRenderingMode(.alwaysOriginal)
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        self.navigationItem.rightBarButtonItems = [moreButtonItem, searchButtonItem ]
    }
    
    func handleSearch() {
        print("123")
    }
    
    func handleMore() {
        print("123")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.menuBarCollectionView{
            return 4
        }else{
            return videos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuBarCollectionView{
            let cellMenuBar = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMenuBar", for: indexPath) as! MenuBarCollectionViewCell
            cellMenuBar.imageIconMenu.image = UIImage(named: listIConTabbar[indexPath.item])?.withRenderingMode(.alwaysTemplate)
            cellMenuBar.tintColor = UIColor.darkGray
            return cellMenuBar
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! HomeCollectionViewCell
            cell.video = videos[indexPath.item]
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
