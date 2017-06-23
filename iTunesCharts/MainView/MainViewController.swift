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

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MainViewModel()
    var tappedId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;

        self.viewModel.loadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailView" {
            let vc: DetailViewController = segue.destination as! DetailViewController
            vc.itunesId = self.tappedId
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let model = self.viewModel.modelForItemAtIndexPath(indexPath)
        
        cell.rankingLabel.text = "\(indexPath.row + 1)"
        cell.titleLabel.text = model.title
        cell.iconImageView.sd_setImage(with: URL(string: model.iconImageUrl), placeholderImage: UIImage(named: "placeholder"))

        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tappedId = self.viewModel.modelForItemAtIndexPath(indexPath).itunesId
        self.performSegue(withIdentifier: "ShowDetailView", sender: self)
    }
}

