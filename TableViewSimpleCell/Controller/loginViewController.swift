//
//  loginViewController.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-24.
//

import UIKit

class loginViewController: UIViewController,ViewControllerDelegate {

    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    private var userLogued : String = ""
    
    //public var users = [Users]()
    
    @IBAction func btnSeePassword(_ sender: Any) {
        if(txtPassword.isSecureTextEntry == true){
            txtPassword.isSecureTextEntry = false
        }
        else{
            txtPassword.isSecureTextEntry = true
        }
    }
    
    
    

    @IBAction func btnSingIn(_ sender: Any) {
        if(UsersProvider.all.contains(where: { $0.user == txtUser.text})){
            let index = UsersProvider.all.firstIndex(where: {$0.user == txtUser.text})!
            if(txtPassword.text == UsersProvider.all[index].pasword){
                print("User found!")
                userLogued = txtUser.text!
            }
            lblMessage.isHidden = false
            lblMessage.text = "Password wrong"
            
        }
        else{
            lblMessage.isHidden = false
            lblMessage.text = "User doesn't exist"
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsersProvider.all.append(Users(user: "carolina", pasword: "caro123"))
        UsersProvider.all.append(Users(user: "andrea", pasword: "andre123"))
        

        // Do any additional setup after loading the view.
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toViewController{
            //return !txtMessageWelcome.text!.isEmpty
            return !userLogued.isEmpty
             
        }
        if identifier == Segue.toRegisterViewController{
            return true
        }
        return false
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.toViewController ){
            let viewController = segue.destination as! ViewController
            viewController.welcomeMessage = userLogued
        }
        if(segue.identifier == Segue.toRegisterViewController){
            
        }
        else {
            (segue.destination as! ViewController).delegate = self
        }
            
        

        
    }
    
    //from the ViewControllerDelegate protocol
    func refreshUser() {
        userLogued = ""
        txtUser.text = ""
        txtPassword.text = ""
    }
   
    

}
