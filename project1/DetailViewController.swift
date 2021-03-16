//
//  DetailViewController.swift
//  project1
//
//  Created by mac on 2021/3/12.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? //設好變數 但加上問號表示可以為空 可以在上一層給值
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title為照片名稱
        title = selectedImage
        //不要放大標題
        navigationItem.largeTitleDisplayMode = .never
        //if imageToLoad存在。必須加上if 因為xcode不會讓可能不存在的值執行過 會有error
        
        
        //在navigation bar右側加上分享的bar item 點下後會詢問使用者要如何分享或儲存
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped)) //shareTapped是個func
        
        if let imageToLoad = selectedImage { 
            //圖格=
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

    @objc func shareTapped() { //加上@objc才能被object c 認出來
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("No image found")
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
