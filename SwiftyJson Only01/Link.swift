//
//  LinkViewCell.swift
//  SwiftyJson Only01
//
//  Created by Mac on 2017/05/09.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class LinkViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var lastname: UILabel!

    @IBOutlet weak var myImageView: UIImageView!
    
    func setCell(_ links: Links) {
        self.title.text = links.title as String
        self.lastname.text = links.lastname as String
        //以下だとスムーズに表示されない？
//        let imageData :NSData = try! NSData(contentsOfURL: links.imageUrl!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
//        self.myImageView.image = UIImage(data:imageData)
        
        let req = URLRequest(url:links.imageUrl! as URL)
        NSURLConnection.sendAsynchronousRequest(req, queue:OperationQueue.main){(res, data, err) in
            self.myImageView.image = UIImage(data:data!)
            // 画像に対する処理 (UcellのUIImageViewに表示する等)
            //self.userProfilePic.image = UIImage(data:data!)
        }
        
    }

}
