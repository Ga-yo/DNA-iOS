//
//  CommentList.swift
//  DNA
//
//  Created by 장서영 on 2021/06/03.
//

import Foundation

enum CommentList: API {
    case commentList(_ size: Int, _ page: Int)
    case commentWr(_ timelineId: Int, _ content: String)
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
