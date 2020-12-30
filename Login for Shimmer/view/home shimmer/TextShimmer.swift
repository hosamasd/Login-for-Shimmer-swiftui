//
//  TextShimmer.swift
//  Second Shimmer
//
//  Created by hosam on 12/30/20.
//

import SwiftUI

struct TextShimmer: View {
    
    var text: String// = "hosam"
    @State var animation = false
    @Binding var multiColors: Bool
     var fromRight: Bool = false

    
    
    var body: some View {
       
        
        ZStack{
            
            if fromRight {
                
                // MultiColor Text....
                
                HStack(spacing: 0){
                    
                    ForEach(0..<text.count,id: \.self){index in
                        
                        Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                            .font(.system(size: 65, weight: .bold))//75
                            .foregroundColor(multiColors ? randomColor() : Color.white)
                    }
                }
                // Masking For Shimmer Effect...
                .mask(
                
                    Rectangle()
    //                    // For Some More Nice Effect Were Going to use Gradient...
                        .fill(
    //
    //                        // You can use any Color Here...
                            LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                        )
                        .rotationEffect(.init(degrees: 70))
                        .padding(20)
                    // Moving View Continously...
                    // so it will create Shimmer Effect...
                        
                        .offset(x: 550)
                        .offset(x: animation ? -700 : 0)
                )
//                .onAppear(perform: {
//
//                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
//
//                        animation.toggle()
//                    }
//                })
                
                Text(text)
                    .font(.system(size: 65, weight: .bold))
    //                .foregroundColor(Color.primary.opacity(0.25))
                    .foregroundColor(Color.white.opacity(0.25))
                
            }
            else {
            
            Text(text)
                .font(.system(size: 65, weight: .bold))
//                .foregroundColor(Color.primary.opacity(0.25))
                .foregroundColor(Color.white.opacity(0.25))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 65, weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
//                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
//
//                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: -70))
                    .padding(20)
                // Moving View Continously...
                // so it will create Shimmer Effect...
                    
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            
//            .onAppear(perform: {
//
//                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
//
//                    animation.toggle()
//                }
//            })
        }
        
        }
        .onAppear(perform: {
        
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                
                animation.toggle()
            }
        })
        
    }
    
    // Random Color....
    
    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....
    
    func randomColor()->Color{
        
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
    
}

struct TextShimmer_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

