//
//  Cells.swift
//  SwiftyJson Only01
//
//  Created by Mac on 2017/05/09.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation

class Links : NSObject {
    var title:NSString
    var lastname:NSString
    var imageUrl:URL?
    
    init(title: String, lastnamex: String, imageUrl: URL?){
        self.title = title as NSString
        self.lastname = lastnamex as NSString
        self.imageUrl = imageUrl
        
    }
}
