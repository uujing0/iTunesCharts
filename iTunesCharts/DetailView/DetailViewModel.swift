//
//  DetailViewModel.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 23..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

class DetailViewModel: NSObject {
    var data: DetailModel?
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        if self.data != nil {
            return 1
        }
        
        return 0
    }
    
    func loadData(_ itunesId: String, completion: @escaping () -> ()) {
        self.getData(fromService: DetailService(itunesId: itunesId), completion: completion)
    }
    
    func getData<Service: Gettable>(fromService service: Service, completion: @escaping () -> ()) where Service.Data == DetailModel {
        service.get() { result in
            
            switch result {
            case .Success(let data):
                self.data = data
                completion();
            case .Failure(let error):
                self.showError(error: error)
            }
        }
    }
    
    func showError(error: String) {
        // error
    }
}
