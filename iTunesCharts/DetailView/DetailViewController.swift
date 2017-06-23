//
//  DetailViewController.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itunesId: String = ""
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.estimatedRowHeight = 80

        self.viewModel.loadData(itunesId) {
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

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            let iconImageUrl: String = (self.viewModel.data?.artworkUrl100)!
            
            cell.iconImageView.sd_setImage(with: URL(string: iconImageUrl), placeholderImage: UIImage(named: "placeholder"))
            cell.titleLabel.text = self.viewModel.data?.trackName
            cell.artistLabel.text = self.viewModel.data?.artistName
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageScrollTableViewCell", for: indexPath) as! DetailImageScrollTableViewCell
            cell.addImages(screenshotUrls: (self.viewModel.data?.screenshotUrls)!)
            
            return cell

        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDescTableViewCell", for: indexPath) as! DetailDescTableViewCell
            cell.descriptionLabel.text = self.viewModel.data?.description
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
