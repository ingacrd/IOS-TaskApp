//
//  TaskTableViewCell.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-31.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    private var task: Task?
    static let identifier = "TaskTableViewCell"
    

    @IBOutlet weak var txtDescription: UILabel!
    
    @IBOutlet weak var txtInstruction: UILabel!
    
    @IBOutlet weak var swDone: UISwitch!
    
    @IBAction func swDoneChanged(_ sender: Any) {
        self.task!.done = swDone.isOn
        setCellContent(task: self.task!)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    ///This function will receive the task object and update the taskTableViewCell conten view
    public func setCellContent(task : Task){
        self.task = task
        txtDescription.text = task.description
        txtInstruction.text = task.instructions
        swDone.isOn = task.done
        
        if task.done {
            contentView.backgroundColor = .green.withAlphaComponent(0.2)
        } else {
            contentView.backgroundColor = .red.withAlphaComponent(0.2)
        }
    }
    
}
