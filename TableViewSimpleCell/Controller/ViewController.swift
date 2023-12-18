//
//  ViewController.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-12.
//

import UIKit
protocol ViewControllerDelegate {
    func refreshUser()
}

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, SecondViewControllerDelegate{

    
    public var welcomeMessage : String?
    public var indexSearched: Int?
    public var isTaskSearched: Bool?
    //private var selectedRow : Int?
    private var selectedIndex : Int? //I want to send the object
    private var selectedTask : Task?
    private var listSelectedTask = [Task]()
    public var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var txtSearchTask: UITextField!
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var lblWelcomeMessage: UILabel!
    
    @IBAction func btnSearchTask(_ sender: Any) {
        
        TableView.reloadData()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWelcomeMessage.text = "Welcome "
        lblWelcomeMessage.text! += welcomeMessage ?? " "
        initialize()
    }
    

    @IBAction func btnLogout(_ sender: Any) {
        
        //welcomeMessage = ""
        if delegate != nil{//somebody is listening the protocol

            delegate!.refreshUser()
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func initialize() {
        TaskProvider.generateMockData()
        
        //Register the cusomized table view cell we created to be able to dequeue and use.
        TableView.register(UINib(nibName: TaskTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TaskTableViewCell.identifier)
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return TaskProvider.generateFilter(searchFor: txtSearchTask.text!).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        
        let task = TaskProvider.generateFilter(searchFor: txtSearchTask.text!)[indexPath.row]
    
        cell.setCellContent(task: task)
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(TaskProvider.generateFilter(searchFor: txtSearchTask.text!)[indexPath.row]) selected!")
        
        self.selectedIndex = indexPath.row
        self.selectedTask = TaskProvider.generateFilter(searchFor: txtSearchTask.text!)[indexPath.row]
    
        //call the segue
        performSegue(withIdentifier: Segue.toSecondViewController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if(segue.identifier == Segue.toSecondViewController){
            
            //let secondViewController = segue.destination as! SecondViewController
            //secondViewController.selectedRow = selectedRow
            (segue.destination as! SecondViewController).selectedIndex = self.selectedIndex
            (segue.destination as! SecondViewController).selectedTask = self.selectedTask
            
            
        }
        (segue.destination as! SecondViewController).delegate = self
        
    }
    //from the SecondViewControllerDelegate protocol
    func refreshTable() {
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

