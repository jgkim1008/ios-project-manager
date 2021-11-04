//
//  ListView.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/01.
//

import SwiftUI



struct TaskListView: View {
    @State var memoStatus : Status
    @ObservedObject var viewModel: TaskListViewModel = TaskListViewModel()
  
    var body: some View {
        List{
            Section(header: Text(memoStatus.rawValue).font(.title3).foregroundColor(.black)) {
                RowView(memoStatus: memoStatus, viewModel: viewModel)
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
