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
    
    func format(date: Date) -> some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY.M.d"
        
        return Text(dateFormatter.string(from: date))
    }
    
    var body: some View {
        ForEach(viewModel.selectTaskList(through: memoStatus), id: \.self) { task in
            HStack {
                VStack(alignment:.leading) {
                    Text(task.title).font(.title3)
                    Text(task.message)
                    format(date: task.date)
                    .environment(\.defaultMinListRowHeight, 50)
                }
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                clicked = !clicked
            }.sheet(isPresented: $clicked, onDismiss: {
                viewModel.fetchTasks()
            }) {
                NewTaskView(title: task.title, date: task.date, message: task.message, task: task)
            }
            .onAppear {
                viewModel.fetchTasks()
            }
            .onLongPressGesture {
                Button {
                    "tapped"
                } label: {
                    Text("Move")
                }

            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(role: .destructive) {
                print("delete")
            } label: {
                Label("Delete", systemImage: "trash.fill")
            }
            
        }
        
    }
}

//
//    
//    
//    
//}
//
//struct CustomCell_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        CustomCell(model: MockData())
//    }
//}
