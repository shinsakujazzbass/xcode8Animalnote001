//
//  ViewController.swift
//  SwiftyJson Only01
//
//  Created by Mac on 2017/05/09.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedItem: String?
    var selectedUrl: String?
    // 7. SecondViewに渡す文字列
    var selectedText: String?
    
    var links:[Links] = [Links]()
    
    var refreshControl:UIRefreshControl!

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        self.refreshControl.addTarget(self, action: #selector(ViewController.refresh), for: UIControlEvents.valueChanged)
        
        self.tableView.addSubview(refreshControl)
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
  
        //setvetssweb()
        setupLinks()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func refresh()
    {
        // 更新するコード(webView.reload()など)
        print("reLoad")
        links.removeAll()
        setupLinks()
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count // link数に変更
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // IdentifierがLinkViewCellのセルを使いまわす
        let cell: LinkViewCell = tableView.dequeueReusableCell(withIdentifier: "LinkViewCell")! as! LinkViewCell
        // cellの内容を設定
        cell.setCell(links[indexPath.row])
        return cell
    }
    
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        
        //print(links[indexPath.row].title)
        selectedItem = String(links[indexPath.row].title)
        //selectedUrl = String(links[indexPath.row].imageUrl)
        //let cell: LinkViewCell = tableView.dequeueReusableCellWithIdentifier("LinkViewCell")! as! LinkViewCell
//        let cell = tableView.dequeueReusableCellWithIdentifier("LinkViewCell", forIndexPath: indexPath)
        self.selectedText = String(links[indexPath.row].title)

        print(selectedText)
//        if selectedItem != nil {
//            print("選択")
//            print(selectedItem)
            //let photoadd = self.storyboard?.instantiateViewControllerWithIdentifier("showDetailView2") as!DetailViewController
            //photoadd.modalTransitionStyle = .PartialCurl
            //self.presentViewController(photoadd, animated: true, completion: nil)
////            
////            // SubViewController へ遷移するために Segue を呼び出す
//            //performSegueWithIdentifier("showDetailView",sender: nil)
//        }
        //selectedItem = String(links[indexPath.row].title)
        
        // 8. SecondViewControllerに渡す文字列をセット
        
        
        // 8. SecondViewControllerへ遷移するSegueを呼び出す
        //let viewController = DetailViewController.instantiate()
        //presentViewController(viewController, animated: true, completion: nil)
        performSegue(withIdentifier: "showDetailView",sender: nil)
        
    }
    
    // segueで遷移するときに、行われる前処理
    // 今選択されたcellの情報を遷移先の画面に渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetailView") {
            print("showDetailViewxx")
            let detailviewController : DetailViewController = segue.destination as! DetailViewController
            
            detailviewController.info = self.selectedText
            detailviewController.callBackAction = {self.setupLinks()}
        }
    }
    
    // linksの設定
    func setupLinks() {
        // 適当なデータを設定します
        let url = URL(string: "http://221.186.88.92/chikutbjsoncnv.php")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error == nil {
                do {
                    // リソースの取得が終わると、ここに書いた処理が実行される
                    let json = try JSON(data: data!)
                    // 各セルに情報を突っ込む
                    let line = json["chikutb"]
                    //print(json["students"][0]["lastname"])
                    // 配列要素の取り出し
                    var cnt = -1
                    var cntx = -1
                    print(line)
                    for (i,students) in line {
                        cntx += 1
                        //cntx = cnt
                        //print(["firstname"])
                        //print(students)
                        for (key, value) in students {
                            //print("\(key): \(value)")
                            //print(value)
                        }
                        //var name:String
                        //name = json["students"][0]["firstname"] as String
                        print(json["students"][cntx]["firstname"])
                        
                        //json配列から変数へキャスト
                        let namex = json["chikutb"][cntx]["chikuid"].string
                        let namey = json["chikutb"][cntx]["chikuname"].string
                        let l1 = Links(title: namex!, lastnamex: namey!, imageUrl: NSURL(string: "http://221.186.88.92/testimage.jpg")! as URL)
                        self.links.append(l1)
                    }
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                } catch let jsonError {
                    //print(jsonError.localizedDescription)
                }
            }
        }
        task.resume()
 
        
        
        
    }
    




    
}

