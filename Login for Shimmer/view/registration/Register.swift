//
//  Register.swift
//  Login_Scroll
//
//  Created by Balaji on 18/10/20.
//

import SwiftUI

struct Register: View {
    
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var number = ""
    
    @Binding var show : Bool
    
    @Namespace var animation
    @StateObject var model = ModelData()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack{
                
                HStack{
                    
                    Button(action: {show.toggle()}) {
                        
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                HStack{
                    
                    Text("Create Account")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading)
                
                CustomTextField(image: "person", title: "FULL NAME", value: $model.name_SignUp, animation: animation)
                
                CustomTextField(image: "envelope", title: "EMAIL", value: $model.email_SignUp, animation: animation)
                    .padding(.top,5)
                
                CustomTextField(image: "lock", title: "PASSWORD", value: $model.password_SignUp, animation: animation)
                    .padding(.top,5)
                
                CustomTextField(image: "lock", title: "Re PASSWORD", value: $model.reEnterPassword, animation: animation)
                    .padding(.top,5)
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: model.signUp) {
                        
                        HStack(spacing: 10){
                            
                            Text("SIGN UP")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                        
                    }
                }
                .padding()
                .padding(.top)
                .padding(.trailing)
                
                HStack{
                    
                    Text("Already have a account?")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Button(action: {show.toggle()}) {
                        
                        Text("sign in")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                    }
                }
                .padding()
                .padding(.top,10)
                
            }
        })
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        // Alerts...
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("Ok")))
        })
    }
}
