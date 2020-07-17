//
//  SideScrollSegue.swift
//  SwiftyJson Only01
//
//  Created by Mac on 2017/05/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SideScrollSegue: UIStoryboardSegue {
    
    override func perform() {
        let source = self.source as UIViewController!
        let destination = self.destination as UIViewController!
        
        source?.navigationController?.pushViewController(destination!, animated: true)
    }

}
