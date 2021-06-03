//
//  CommentList.swift
//  DNA
//
//  Created by 장서영 on 2021/03/18.
//

import Foundation

struct CommentList: Codable {
    var totalElements = Int()
    var totalPages = Int()
    var commentResponses = [Comment]()
    
    init(totalElements: Int, totalPages: Int) {
        self.totalElements = totalElements
        self.totalPages = totalPages
    }
}
