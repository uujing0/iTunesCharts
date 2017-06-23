//
//  DetailService.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

struct DetailService: Gettable {
    let itunesId: String
    
    init(itunesId: String) {
        self.itunesId = itunesId
    }
    
    func get(completionHandler: @escaping (Result<DetailModel>) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: "https://itunes.apple.com/lookup?id=" + self.itunesId + "&country=kr")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                completionHandler(.Failure(error!.localizedDescription))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            
            if let jsonDict = json as? NSDictionary {
                let resultObject = jsonDict.object(forKey: "results") as? Array<NSDictionary>
                if let appInfoObject = resultObject?.first {
                    let model = self.parseModel(appInfoObject)
                    
                    completionHandler(.Success(model))
                    return
                }
            }
        }
        
        task.resume()
    }
    
    func parseModel(_ dic: NSDictionary) -> DetailModel {
        let screenshotUrls = dic.object(forKey: "screenshotUrls") as! [String]
        let releaseNotes = dic.object(forKey: "releaseNotes") as! String
        let minimumOsVersion = dic.object(forKey: "minimumOsVersion") as! String
        let description = dic.object(forKey: "description") as! String
        let trackName = dic.object(forKey: "trackName") as! String
        let artistName = dic.object(forKey: "artistName") as! String
        let artworkUrl100 = dic.object(forKey: "artworkUrl100") as! String

        return DetailModel(screenshotUrls: screenshotUrls,
                           releaseNotes: releaseNotes,
                           minimumOsVersion: minimumOsVersion,
                           description: description,
                           trackName: trackName,
                           artistName: artistName,
                           artworkUrl100: artworkUrl100)
    }
}
