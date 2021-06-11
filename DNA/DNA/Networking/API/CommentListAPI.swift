//
//  CommentListAPI.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

enum CommentListAPI: API {
    case commentList(_ id: Int)
    case commentWr
    case deleteComment
    
    func path() -> String {
        switch self {
        case .commentList(let id):
            return "/comment/\(id)?size=&page="
        case .commentWr :
            return "/comment"
        case .deleteComment:
            return "/comment"
        }
    }
}
