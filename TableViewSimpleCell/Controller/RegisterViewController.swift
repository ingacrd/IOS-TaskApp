//
//  RegisterViewController.swift
//  TableViewSimpleCell
//
//  Created by english on 2023-10-24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtRegisterUser: UITextField!
    
    @IBOutlet weak var txtRegisterPassword: UITextField!
    
    @IBAction func btnSeePassword(_ sender: Any) {
        if(txtRegisterPassword.isSecureTextEntry == true){
            txtRegisterPassword.isSecureTextEntry = false
        }
        else{
            txtRegisterPassword.isSecureTextEntry = true
        }
    }
    //private var userRegistered: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
        if(!txtRegisterUser.text!.isEmpty){
            if(!txtRegisterPassword.text!.isEmpty){
                UsersProvider.all.append(Users(user: txtRegisterUser.text!, pasword: txtRegisterPassword.text!))
                
                navigationController?.popViewController(animated: true)
                //userRegistered = txtRegisterUser.text!
            }
            //Message you have to input a password
        }
        else{
            //Message you have to input an user
        }
        //userRegistered = txtRegisterUser.text!
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.toLoginViewController){
            let loginViewController = segue.destination as! loginViewController
            
        }
    }*/


}
