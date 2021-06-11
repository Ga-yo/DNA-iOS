//
//  TimeLineResponseModel.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

struct TimeLine: Codable {
    var timelineId = Int()
    var title = String()
    var content = String()
    var name = String()
    var isMine = Bool()
    var createdAt = String()
    var type = String()
    
    init(timelineId: Int, title: String, content: String, name: String, isMine: Bool, createdAt: String, type: String) {
        self.timelineId = timelineId
        self.title = title
        self.content = content
        self.name = name
        self.isMine = isMine
        self.createdAt = createdAt
        self.type = type
    }
}
