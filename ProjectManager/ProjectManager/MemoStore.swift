//
//  MemoStore.swift
//  ProjectManager
//
//  Created by 김준건 on 2021/11/03.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "test1"),
            Memo(content: "test2"),
            Memo(content: "test3")
        ]
    }
    
    func inset(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        self.list.removeAll() { $0 == memo }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            self.list.remove(at: index)
        }
    }
}
