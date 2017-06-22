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
        let imageUrl = dic.value(forKeyPath: "im:image") as! Array<NSDictionary>
        let imageUrl2 = imageUrl.first?.object(forKey: "label");
        return MainModel(itunesId: "", title: dic.value(forKeyPath: "im:name.label") as! String, iconImageUrl: imageUrl2 as! String)
    }
}
