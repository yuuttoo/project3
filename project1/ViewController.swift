//
//  ViewController.swift
//  project1
//
//  Created by mac on 2021/3/12.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // picture to load
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    //改變父interface 會有override
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { //指定controller名稱與id
            // 2: success! Set its selectedImage property
            ////先到下一層設好變數 這裡可以直接給值
            vc.selectedImage = pictures[indexPath.row]

            // 3: now push it onto the navigation controller
            //給值後 進入下一頁
            navigationController?.pushViewController(vc, animated: true)
           
        }
        // let 前面加上 if 確保如果前提不成立 後面就不會執行 避免error
    }
}

