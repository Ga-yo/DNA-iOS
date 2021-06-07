//
//  CommentList.swift
//  DNA
//
//  Created by 장서영 on 2021/06/03.
//

import Foundation

enum CommentList: API {
    case commentList
    case commentWr
    case deleteComment
    
    func path() -> String {
        switch self {
        case .commentList, .commentWr :
            return "/comment"
        case .deleteComment:
            return "/comment"
        }
    }
}
