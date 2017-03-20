//
//  Extension.swift
//  FakeYouTuBe
//
//  Created by kienND9 on 3/20/17.
//  Copyright © 2017 kienND9. All rights reserved.
//

import UIKit

extension UIImageView{
    func loadImageFromURL(urlString: String) {
        let url = URL(string: urlString)
        image = nil
        URLSession.shared.dataTask(with: url! as URL ){
            (data, reponses, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
            }.resume()
    }
}
