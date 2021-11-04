////
////  MockData.swift
////  ProjectManager
////
////  Created by 김준건 on 2021/11/03.
////
//
//import Foundation
//
//class MockData {
//    var tasks: [TLTask] = []
//    
//    init() {
//        tasks = [
//            TLTask(id: UUID(), title: "test", message: "되요??", date: Date()),
//            TLTask(id: UUID(), title: "test!", message: "안되요??", date: Date()),
//            TLTask(id: UUID(), title: "test!!", message: "되요??", date: Date()),
//            TLTask(id: UUID(), title: "test!!!", message: "되요??", date: Date())
//        ]
//    }
//}
//
//extension MockData: DataManagerProtocol {
//    var fetchTask: [TLTask] {
//        return tasks
//    }
//    
//    func addTask(title: String, message: String, date: Date) {
//        let task = TLTask(title: title, message: message, date: date)
//        tasks.insert(task, at: 0)
//    }
//    
//}
//
