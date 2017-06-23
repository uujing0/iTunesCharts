//
//  APIController.swift
//  iTunesCharts
//
//  Created by Jang Yujin on 2017. 6. 22..
//  Copyright © 2017년 you9010. All rights reserved.
//

import Foundation

enum Result<T> {
    case Success(T)
    case Failure(String)
}

protocol Gettable {
    associatedtype Data
    
    func get(completionHandler: @escaping (Result<Data>) -> Void)
}


