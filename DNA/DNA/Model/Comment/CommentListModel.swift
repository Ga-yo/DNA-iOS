//
//  CommentListModel.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

struct CommentList: Codable {
    var totalElements = Int()
    var totalPages = Int()
    var commentResponses = [Comment]()
}
