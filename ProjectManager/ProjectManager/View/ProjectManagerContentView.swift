//
//  ProjectManagerContentView.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/10/31.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProjectManagerContentView: View {
    @StateObject var viewModel = TaskListViewModel()
    
    @State private var isShowingAddNew = false

    var body: some View {
        NavigationView {
            HStack(alignment: .firstTextBaseline) {
                TaskListView(memoStatus: .TODO ,viewModel: viewModel)
                TaskListView(memoStatus: .DOING ,viewModel: viewModel)
                TaskListView(memoStatus: .DONE ,viewModel: viewModel)
            }
            .padding(.top)
            .padding(.bottom)
            .navigationTitle("Project Manager")
            .navigationBarItems(trailing: addNewButton)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isShowingAddNew, onDismiss: {
            print(viewModel.tasks)
        }) {
            NewTaskView(viewModel: viewModel)
        }
    }
    
    private var addNewButton: some View {
        Button {
            isShowingAddNew = true
        } label: {
            Image(systemName: "plus")
        }

    }
}


@available(iOS 15.0, *)
struct ProjectManagerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectManagerContentView()
    }
}
