//
//  ListAPI.swift
//  DNA
//
//  Created by 장서영 on 2021/06/03.
//

import Foundation

enum ListAPI: API {
    case timeLine(_ type : String)
    case timeLineWr(_ title: String, _ content: String, _ type: String)
    case deleteTimeLine
    
    func path() -> String {
        switch self {
        case .timeLine(let type):
            return "/timeline/\(type)?size=&page="
        case .timeLineWr:
            return "/timeline"
        case .deleteTimeLine:
            return "/timeline"
        }
    }
}
