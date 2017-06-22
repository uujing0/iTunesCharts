//
//  ViewController.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 20..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit

class SwitchWithTextTableViewCell: UITableViewCell {
    func configure() {
    
    }
}

//class ViewController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        /*let config = URLSessionConfiguration.default
//         let session = URLSession(configuration: config)
//         
//         let url = NSURL(string: "https://www.example.com/")!
//         
//         //let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//         
//         //}
//         
//         //task.resume(); */
//        
//        // 1.
//        /*let urlString = URL(string: "http://jsonplaceholder.typicode.com/users/1")
//         if let url = urlString {
//         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//         if error != nil {
//         print(error)
//         } else {
//         if let usableData = data {
//         print(usableData) //JSONSerialization
//         }
//         }
//         }
//         task.resume()
//         }*/
//        
//        // 2.
//        /*let session = URLSession.shared
//         let url = URL(string: "http://masilotti.com")!
//         let task = session.dataTask(with: url) { (data, _, _) -> Void in
//         if let data = data {
//         let string = String(data: data, encoding: String.Encoding.utf8)
//         print(string) //JSONSerialization
//         }
//         }
//         task.resume() */
//        
//        // 3.
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        let url = URL(string: "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json")!
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                print(data) // JSON Serialization
//            }
//        }
//        task.resume()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}

