//
//  MainViewModel.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

//protocol Gettable {
//    associatedtype Data
//    
//    func get(completionHandler: @escaping (Result<Data>) -> Void)
//    //func parseModel(_ dic: NSDictionary) -> Data
//}


protocol ViewModelDataSource {
    associatedtype ViewModelData
    
    var data: ViewModelData? { get }
    
    func loadData(_ completion: @escaping () -> ())
    func getData<Service: Gettable>(fromService service: Service, completion: @escaping () -> ()) where Service.Data == ViewModelData
    func showError(error: String)
}


class MainViewModel: NSObject, ViewModelDataSource {
    var data: [MainModel]?
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func modelForItemAtIndexPath(_ indexPath: IndexPath) -> MainModel {
        return data?[indexPath.row] ?? MainModel()
    }
    
    func loadData(_ completion: @escaping () -> ()) {
        self.getData(fromService: MainService(), completion: completion)
    }
    
    func getData<Service: Gettable>(fromService service: Service, completion: @escaping () -> ()) where Service.Data == [MainModel] {
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
