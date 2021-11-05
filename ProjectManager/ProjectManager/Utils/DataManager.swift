//
//  ProjectDataManager.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/03.
//

import Foundation

protocol DataManagerProtocol {
    func addTask(title: String, message: String ,date: Date, status: Status)
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date)
    func deleteTask(task: TLTask)
    func modifyStatus(task: TLTask, status: Status)
    var fetchTask: [TLTask] { get }
}

class DataManager {
    
    static let shared: DataManagerProtocol = DataManager()
    
    private var tasks: [TLTask] = []
    
    private init() {}
}

extension DataManager: DataManagerProtocol {
    func addTask(title: String, message: String, date: Date, status: Status) {
        let task = TLTask(title: title, message: message, date: date, status: status)
        tasks.insert(task, at: 0)
    }
    
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date) {
        tasks.firstIndex { $0.id == task?.id }.flatMap { tasks[$0] = TLTask(title: title, message: message, date: date, status: status) }
    }
    
    var fetchTask: [TLTask] {
        return tasks
    }
    
    func deleteTask(task: TLTask) {
//        print("삭제하려고 합니다.\(task)")
        tasks.firstIndex { $0.id == task.id }.flatMap { tasks.remove(at: $0) }
        print("삭제했습니다..\(tasks)")
    }
    
    func modifyStatus(task: TLTask, status: Status) {
        tasks.firstIndex { $0.id == task.id }.flatMap { tasks[$0] = TLTask(title: task.title, message: task.message, date: task.date, status: status) }

    }
}


