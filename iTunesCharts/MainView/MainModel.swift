//
//  MainModel.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

struct MainModel {
    let itunesId: String
    let title: String
    let iconImageUrl: String
    
    init() {
        self.itunesId = ""
        self.title = ""
        self.iconImageUrl = ""
    }
    
    init(itunesId: String, title: String, iconImageUrl: String) {
        self.itunesId = itunesId
        self.title = title
        self.iconImageUrl = iconImageUrl
    }
}
