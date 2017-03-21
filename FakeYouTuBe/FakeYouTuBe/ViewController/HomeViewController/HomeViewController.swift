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
    
//    var videos: [Video] = {
//        var channel = Channel()
//        channel.name = "ThisIsTheBestChannel gfdgsdfgsdgsdfgdfsgdf"
//        channel.profileImageName = "profileImage"
//        
//        var blankSpaceVideo = Video()
//        blankSpaceVideo.title = "Taylor Swift - Blank Space sfasdfsafsadfsadfsdfsadfsdf"
//        blankSpaceVideo.thumbnailImageName = "taylor-swift"
//        blankSpaceVideo.channel = channel
//        blankSpaceVideo.numberOfViews = 23542453455
//        return [blankSpaceVideo]
//    }()
    var videos: [Video]?
    
    func fetchVideos(){
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let dataTask = URLSession.shared.dataTask(with: url! as URL){ (data, response, error) in
            
            if error != nil{
                print(error)
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                self.videos = [Video]()
                for dictionary in json as! [[String:AnyObject]]{
                    let video = Video()
                    video.title = dictionary["title"] as! String?
                    video.numberOfViews = dictionary["number_of_views"] as! NSNumber?
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as! String?
                    
                    let channelDictionary = dictionary["channel"] as! [String:AnyObject]
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as! String?
                    channel.profileImageName = channelDictionary["profile_image_name"] as! String?
                    video.channel = channel
                    self.videos?.append(video)
                }
                
                //DispatchQueue.main.async {
                    self.collectionView.reloadData()
                //}
                
                
            }catch let jsonError{
                print(jsonError)
            }
            
        }
        dataTask.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingNavigation()
        settingCollectionView()
        fetchVideos()
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
        var blackView = BlackView()
        blackView.handleMore()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.menuBarCollectionView{
            return 4
        }else {
            if collectionView == self.collectionView{
                return videos!.count
            }else{
                return 0
            }
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
            cell.video = videos?[indexPath.item]
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
