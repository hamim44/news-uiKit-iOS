//
//  File.swift
//  news
//
//  Created by Abrar Hamim on 27/7/24.
//

import Foundation

struct NewsModel: Codable {
    let hits: [Post]
}

struct Post:Codable,Identifiable {
    var id: String {
        return objectID
    }
    let points: Int
    let objectID: String
    let title: String
    let url:String
    
}
