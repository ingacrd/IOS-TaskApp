//
//  TestProvider.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-12.
//

import Foundation

class TaskProvider {

    static var all = [Task]()

    static func generateMockData() {
        
        for i in 0..<100 {
            TaskProvider.all.append(Task(description: "Task #\(i+1)", instructions: "instruction #\(i+1)", done:false))
               
        }
			
    }
    
    static func generateFilter(searchFor: String) -> [Task] {
        
        if searchFor.isEmpty {
            return TaskProvider.all
        }

        var filteredTasks = [Task]()

        for i in 0..<TaskProvider.all.count {
            let task = TaskProvider.all[i]
            if(task.description.contains(searchFor)){
                filteredTasks.append(task)
            }
        }

        return filteredTasks
        
    }
    
    
}
