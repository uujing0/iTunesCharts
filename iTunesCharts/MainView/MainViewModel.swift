//
//  MainViewModel.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

class MainViewModel: NSObject {
    var models: [MainModel]?
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func modelForItemAtIndexPath(_ indexPath: IndexPath) -> MainModel {
        return models?[indexPath.row] ?? MainModel()
    }
    
    func fetchModels(_ completion: @escaping () -> ()) {
        self.getModels(fromService: MainService(), completion: completion)
    }
    
    private func getModels<Service: Gettable>(fromService service: Service, completion: @escaping () -> ()) where Service.Data == MainModel {
            service.get() { result in
                
                switch result {
                case .Success(let models):
                    self.models = models
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
