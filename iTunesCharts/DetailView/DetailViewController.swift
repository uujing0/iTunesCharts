//
//  DetailViewController.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var itunesId: String = ""
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.viewModel.loadData {
//            DispatchQueue.main.async {
//                //self.tableView.reloadData()
//            }
//        }
        
        self.viewModel.loadData(itunesId) {
            DispatchQueue.main.async {
                //self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
