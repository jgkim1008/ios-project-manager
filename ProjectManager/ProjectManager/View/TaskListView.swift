//
//  ListView.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/01.
//

import SwiftUI



struct TaskListView: View {
    @State var memoStatus : Status
    @State var longPressed: Bool = false
    @ObservedObject var viewModel: TaskListViewModel
    
    var body: some View {
        print(#function)
        return List{
            Section(header: Text(memoStatus.rawValue).font(.title3).foregroundColor(.black)) {
                ForEach(viewModel.selectTaskList(through: memoStatus), id: \.self) { task in
                    RowView(memoStatus: memoStatus, viewModel: viewModel, task: task)
                }
            }
        }
    }
}



//struct ListView_Previews: PreviewProvider {
//    static var viewModel: TaskListViewModel {
//        TaskListViewModel(dataManager: MockData())
//    }
//    
//    static var previews: some View {
//        TaskListView(memoStatus:.TODO, viewModel: viewModel)
//    }
//}
