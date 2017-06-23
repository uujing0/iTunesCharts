//
//  MainService.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

struct MainService: Gettable {
    
    func get(completionHandler: @escaping (Result<[MainModel]>) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json")!
        //let url = URL(string: "https://itunes.apple.com/lookup?id=1195804784&country=kr")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler(.Failure(error!.localizedDescription))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            
            if let jsonDict = json as? NSDictionary {
                if let moviesJSON = jsonDict.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                    let models = moviesJSON.map { self.parseModel($0) }
                    completionHandler(.Success(models))
                    return
                }
            }
        }
        
        task.resume()
    }
    
    func parseModel(_ dic: NSDictionary) -> MainModel {
        let title = dic.value(forKeyPath: "im:name.label") as! String
        let itunesId = dic.value(forKeyPath: "id.attributes.im:id") as! String
        let iconImages = dic.value(forKeyPath: "im:image") as! Array<NSDictionary>
        let iconImageUrl = iconImages.first?.object(forKey: "label") as! String
        
        return MainModel(itunesId: itunesId, title: title, iconImageUrl: iconImageUrl)
    }
}
