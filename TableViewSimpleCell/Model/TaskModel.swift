//
//  TaskModel.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-17.
//

import Foundation


class Task {
    public var description : String = ""
    public var instructions: String = ""
    public var done: Bool
    
    init(description: String, instructions: String, done: Bool) {
        self.description = description
        self.instructions = instructions
        self.done = done
    }
}
