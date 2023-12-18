//
//  SecondViewController.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-12.
//

import UIKit

protocol SecondViewControllerDelegate {
    func refreshTable()
}

class SecondViewController: UIViewController {
    
    public var selectedIndex : Int? //I want to send the object
    public var selectedTask : Task?
    public var delegate: SecondViewControllerDelegate?

   // @IBOutlet weak var textMessage: UITextField!
    @IBOutlet weak var textDescription: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var textInstructions: UITextField!
    @IBOutlet weak var swDone: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedTask != nil {
            //let task = TaskProvider.all[selectedRow!]
            textDescription.text = selectedTask!.description
            textInstructions.text = selectedTask!.instructions
            swDone.isOn = selectedTask!.done
        }
        else {
            btnDelete.isHidden = true
        }
        
    }

    
    @IBAction func btnSaveTouchUpInside(_ sender: Any) {
        if !textDescription.text!.isEmpty {
            
            if selectedTask == nil {
                let newTask = Task(description: textDescription.text!, instructions: textInstructions.text!, done: swDone.isOn)
                //adding a new task
                TaskProvider.all.append(newTask)
            }
            else{// updating an existing
                //let task = TaskProvider.all[selectedRow!]
                selectedTask!.description = textDescription.text!
                selectedTask!.instructions = textInstructions.text!
                selectedTask!.done = swDone.isOn
            
            }
            
            if delegate != nil{//somebody is listening the protocol

                delegate!.refreshTable()
            }
            //self.dismiss(animated: true) //does not work with navigation controller
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func btnDeleteTouchUpInside(_ sender: Any) {
        TaskProvider.all.remove(at: selectedIndex!)
        
        if delegate != nil{//somebody is listening the protocol

            delegate!.refreshTable()
        }
        
        //self.dismiss(animated: true)
        navigationController?.popViewController(animated: true)
        
    }

    

 
    




}
