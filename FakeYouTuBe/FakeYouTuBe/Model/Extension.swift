//
//  Extension.swift
//  FakeYouTuBe
//
//  Created by kienND9 on 3/20/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView{
    func loadImageFromURL(urlString: String) {
        let url = URL(string: urlString)
        
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url! as URL ){
            (data, reponses, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
            
            }.resume()
    }
}
