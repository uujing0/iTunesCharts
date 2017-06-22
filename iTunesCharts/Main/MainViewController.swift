//
//  MainViewController.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    let viewModel = MainViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self;
        tableView.dataSource = self;

        self.viewModel.fetchModels {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let imageUrl: String = (self.viewModel.models?[indexPath.row].iconImageUrl)!
        cell.titleLabel.text = self.viewModel.models?[indexPath.row].title
        cell.imageView?.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder.png"))
        
        //cell.configure(withDelegate: MainViewModel())
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

