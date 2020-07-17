//
//  DetailViewController.swift
//  SwiftyJson Only01
//
//  Created by Mac on 2017/05/09.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var callBackAction: (() -> Void)?
    
    var info: String?

    @IBOutlet weak var infoText: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //前画面ボタンとトップ画面ボタンの2つを設定する。
        let leftButton1 = UIBarButtonItem(title: "前画面", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.goTop))
        let leftButton2 = UIBarButtonItem(title: "トップ画面", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetailViewController.goTop))
        //ボタン表示
        self.navigationItem.leftBarButtonItems = [leftButton1]
        self.navigationItem.rightBarButtonItems = [leftButton2]
        
        self.navigationItem.title = "設定"
        
        

        self.infoText.text = self.info
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //トップ画面ボタン押下時の呼び出しメソッド
    func goTop() {
        
        if let viewController = self.navigationController?.popViewController(animated: true) as? DetailViewController {
            //再帰呼び出し
            viewController.goTop()
        }
    }
    
    
    @IBAction func retButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension DetailViewController {
//    
//    
//}
