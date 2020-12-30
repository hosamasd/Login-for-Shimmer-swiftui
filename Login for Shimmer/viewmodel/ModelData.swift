//
//  ModelData.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var name = ""
    
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var name_SignUp = ""
    // AlertView With TextFields....
    
    // Error Alerts...
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    // User Status....
    @AppStorage("name") var names = ""
    @AppStorage("log_Status") var status = false
    
    
    
    
    func checkEmailAndPassword() -> Bool {
        
        if email.isValidEmail && password.count >= 8 {
            return true
        }
        return false
        
    }
    
    func checkEmailAndPasswordAndRepeat() -> Bool {
        
        if email_SignUp.isValidEmail && password_SignUp.count >= 8 && reEnterPassword == password_SignUp {
            return true
        }
        return false
        
    }
    
    
    // Login...
    
    func login(){
        
        // checking all fields are inputted correctly...
        
        if !email.isValidEmail  || password == "" || name == ""{
            
            self.alertMsg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            names = name
            self.status = true
        }
    }
    
    // SignUp..
    
    func signUp(){
        
        // checking....
        
        if !email_SignUp.isValidEmail || password_SignUp == "" || reEnterPassword == "" || name_SignUp == ""{
            
            self.alertMsg = "Fill contents proprely!!!"
            self.alert.toggle()
            return
        }
        
        
        
        if password_SignUp != reEnterPassword{
            
            self.alertMsg = "Password Mismatch !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            names = name_SignUp
            self.status = true
        }
    }
    
    
}
