//
//  DetailImageScrollTableViewCell.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit

class DetailImageScrollTableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addImages(screenshotUrls: [String]) {
        guard screenshotUrls.count > 0 else {
            return
        }
        
        for screenshotUrl in screenshotUrls {
            let imageView: UIImageView = UIImageView()
                imageView.sd_setImage(with: URL(string: screenshotUrl), placeholderImage: UIImage(named: "placeholder"))
            self.stackView.addArrangedSubview(imageView)
        }
    }
}
