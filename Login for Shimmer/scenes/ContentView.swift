//
//  ContentView.swift
//  Login for Shimmer
//
//  Created by hosam on 12/30/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("name") var names = ""
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        ZStack {
            
            if !status {
            
            NavigationView{
                   Login()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
            }
                else {
                    ShimmerContentView()
                }
            
        }
        
       
                
        
        
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
