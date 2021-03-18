//
//  commentResponses.swift
//  DNA
//
//  Created by 장서영 on 2021/03/18.
//

import Foundation

struct TimeLine: Codable {
    var id = Int()
    var title = String()
    var content = String()
    var name = String()
    var is_mine = Bool()
    var created_at = String()
    var type = String()
    
    init(id: Int, title: String, content: String, name: String, is_mine: Bool, created_at: String, type: String) {
        self.id = id
        self.title = title
        self.content = content
        self.name = name
        self.is_mine = is_mine
        self.created_at = created_at
        self.type = type
    }
}
