//
//  ShimmerHome.swift
//  Login for Shimmer
//
//  Created by hosam on 12/30/20.
//

import SwiftUI

struct ShimmerHome: View {
   
    // Toggle For MultiColors...
    @State var multiColor = false
    @AppStorage("name") var names = ""

    var body: some View {
        
        
        VStack(spacing: 25){
            
            TextShimmer(text: "Welcome", multiColors: $multiColor)
            
            TextShimmer(text: "Back", multiColors: $multiColor)
            
            TextShimmer(text: names, multiColors: $multiColor,fromRight:true)
            
            TextShimmer(text: "Thanks!!", multiColors: $multiColor,fromRight:true)
//
            Toggle(isOn: $multiColor, label: {
                Text("Enable Multi Colors")
                    .font(.title)
                    .fontWeight(.bold)
            })
            .padding()
        }
//        .preferredColorScheme(.dark)
        
    }
    
}

struct ShimmerHome_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerHome()
    }
}
