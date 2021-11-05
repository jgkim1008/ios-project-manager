////
////  Cell.swift
////  ProjectManager
////
////  Created by 김준건 on 2021/11/01.
////
//
import SwiftUI

struct RowView: View {
    @State var memoStatus : Status
    @ObservedObject var viewModel: TaskListViewModel
    @State var clicked: Bool = false
    @State var longPressed: Bool = false
    @State var task: TLTask
    
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text(task.title).font(.title3)
                Text(task.message)
                Text(DateFormatter.format(date: task.date)).foregroundColor(viewModel.deadlineOver(date: task.date) ? Color.red : Color.black)
                
            }
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            clicked.toggle()
        }.sheet(isPresented: $clicked, onDismiss: {
            
        }) {
            NewTaskView(viewModel: viewModel, title: task.title, date: task.date, message: task.message, task: task)
        }
        .onAppear {
            viewModel.fetchTasks()
        }
        .onLongPressGesture {
            longPressed.toggle()
            
        }.popover(isPresented: $longPressed, attachmentAnchor: .point(.center), arrowEdge: .leading, content: {
            Button {
                viewModel.modifyStatus(task: task, status: .DOING)
            } label: {
                Text("Move to Doing").padding()
            }
            Button {
                viewModel.modifyStatus(task: task, status: .DONE)
            } label: {
                Text("Move to Done").padding()
            }

        })
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(role: .destructive) {
                    viewModel.delete(task: task)
                } label: {
                    Label("Delete", systemImage: "trash.fill")
                }
                
            }
    }
}
