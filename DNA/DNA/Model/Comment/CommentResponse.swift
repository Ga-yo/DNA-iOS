//
//  CommentListResponse.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

struct Comment: Codable {
    var contentId = Int()
    var content = String()
    var name = String()
    var is_mine = Bool()
    
    init(contentId: Int, content: String, name: String, is_mine: Bool) {
        self.contentId = contentId
        self.content = content
        self.name = name
        self.is_mine = is_mine
    }
}
