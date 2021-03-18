//
//  MainList.swift
//  DNA
//
//  Created by 장서영 on 2021/03/18.
//

import Foundation

struct MainList: Codable {
    var totalElements = Int()
    var totalPages = Int()
    var timelineResponse = [TimeLine]()
    
    init(totalElements: Int, totalPages: Int) {
        self.totalElements = totalElements
        self.totalPages = totalPages
    }
}
