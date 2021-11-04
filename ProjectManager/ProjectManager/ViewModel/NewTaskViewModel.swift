//
//  NewTaskViewModelProtocol.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/03.
//

import Foundation
import Combine

protocol NewTaskViewModelProtocol {
    func addNewTask(title: String,message: String, date: Date, status: Status)
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date)
}

final class NewTaskViewModel: ObservableObject {
    private var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

extension NewTaskViewModel: NewTaskViewModelProtocol {
    func addNewTask(title: String, message: String, date: Date, status: Status) {
        dataManager.addTask(title: title, message: message, date: date, status: status)
    }
    
    func updateTaskList(task: TLTask?, status: Status, title: String, message: String, date: Date) {
        dataManager.updateTaskList(task: task, status: status, title: title, message: message, date: date)
    }

    
    
}
