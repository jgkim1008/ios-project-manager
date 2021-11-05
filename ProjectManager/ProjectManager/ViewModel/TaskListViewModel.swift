//
//  CellViewModel.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/03.
//

import Combine
import SwiftUI

protocol TaskListViewModelProtocol {
    var tasks: [TLTask] { get set }
    func fetchTasks()
    func filterStatus(of task: [TLTask])
    func selectTaskList(through status: Status) -> [TLTask]
    func addNewTask(title: String,message: String, date: Date, status: Status)
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date)
    func modifyStatus(task: TLTask, status: Status)
}

final class TaskListViewModel: ObservableObject {
    @Published var tasks: [TLTask] = []
    var todoTasks: [TLTask] = []
    var doingTasks: [TLTask] = []
    var completeTasks: [TLTask] = []
    
    private var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchTasks()
    }
}

extension TaskListViewModel: TaskListViewModelProtocol {
    func fetchTasks() {
        tasks = dataManager.fetchTask
        filterStatus(of: tasks)
    }
    
    func filterStatus(of task: [TLTask]) {
        Status.allCases.forEach { status in
            switch status {
            case .TODO:
                todoTasks = tasks.filter { $0.status == .TODO }.sorted{ $0.date < $1.date}
            case .DOING:
                doingTasks = tasks.filter { $0.status == .DOING }.sorted{ $0.date < $1.date}
            case .DONE:
                completeTasks = tasks.filter { $0.status == .DONE }.sorted{ $0.date < $1.date}
            }
        }
    }
    
    func selectTaskList(through status: Status) -> [TLTask] {
        switch status {
        case .TODO:
            return todoTasks
        case .DOING:
            return doingTasks
        case .DONE:
            return completeTasks
        }
    }
    
    func addNewTask(title: String, message: String, date: Date, status: Status) {
        dataManager.addTask(title: title, message: message, date: date, status: status)
        fetchTasks()
    }
    
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date) {
        dataManager.updateTaskList(task: task, status: status, title: title, message: message, date: date)
        fetchTasks()
    }
    
    func delete(task: TLTask) {
        dataManager.deleteTask(task: task)
        fetchTasks()
    }
    
    func modifyStatus(task: TLTask, status: Status) {
        dataManager.modifyStatus(task: task, status: status)
        fetchTasks()
    }
    

    func deadlineOver(date: Date) -> Bool {
        date < Date() ? true : false
    }
    
    
    
    
//    func updateTaskList(task: TLTask, status: Status, title: String, message: String, date: Date) {
//        switch status {
//        case .TODO:
//            todoTasks.firstIndex { $0.id == task.id }.flatMap { todoTasks[$0] = TLTask(title: title, message: message, date: date, status: status) }
//            
//        case .DOING:
//            doingTasks.firstIndex { $0.id == task.id }.flatMap { doingTasks[$0] = TLTask(title: title, message: message, date: date, status: status) }
//            
//        case .DONE:
//            completeTasks.firstIndex { $0.id == task.id }.flatMap { completeTasks[$0] = TLTask(title: title, message: message, date: date, status: status) }
//        }
//    }
}


