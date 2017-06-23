//
//  MainTableViewCell.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
