//
//  File.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/03.
//

import Foundation

struct TLTask: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var message: String
    var date: Date
    var status: Status
}


enum Status: String, CaseIterable {
    case TODO = "TODO"
    case DOING = "Doing"
    case DONE = "DONE"
}
