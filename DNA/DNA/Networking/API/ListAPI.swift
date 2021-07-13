//
//  ListAPI.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

enum ListAPI: API {
    case timeLine(_ type : String)
    case timeLineWr
    case deleteTimeLine(_ commentId: Int)
    
    func path() -> String {
        switch self {
        case .timeLine(let type):
            return "/timeline/\(type)?size=&page="
        case .timeLineWr:
            return "/timeline"
        case .deleteTimeLine(let commentId):
            return "/timeline/\(commentId)"
        }
    }
}
