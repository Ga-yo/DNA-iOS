//
//  CommentListResponse.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

struct Comment: Codable {
    var commentId = Int()
    var content = String()
    var name = String()
    var isMine = Bool()
    
    init(commentId: Int, content: String, name: String, isMine: Bool) {
        self.commentId = commentId
        self.content = content
        self.name = name
        self.isMine = isMine
    }
}
