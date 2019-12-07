//
//  ContentView.swift
//  WarCardGame(Swift)
//
//  Created by rs on 06/12/19.
//  Copyright © 2019 rs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rand1 = 0
    @State private var rand2 = 0
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    @State private var count = 0
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Image("card"+String(rand1))
                    Image("card"+String(rand2))
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.rand1 = Int.random(in: 2...14)
                    self.rand2 = Int.random(in: 2...14)
                    
                    if self.rand1 > self.rand2 {
                        self.score1 += 1
                    }
                    else if self.rand1 < self.rand2 {
                        self.score2 += 1
                    }
                    
                    self.count += 1
                    
                    if self.count == 11 {
                        self.score1 = 0
                        self.score2 = 0
                        self.rand1 = 0
                        self.rand2 = 0
                        self.count = 0
                    }
                    
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                
                Spacer()
                
                HStack {
                    
                    VStack {
                        
                        Text("Player")
                            .bold()
                            .padding(.bottom, 20)
                            .font(.custom("Georgia",size: 20))
                        
                        Text("\(score1)")
                            .font(.custom("",size: 58))
                        
                    }.padding(.leading, 30)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("CPU")
                            .bold()
                            .padding(.bottom, 20)
                            .font(.custom("Georgia",size: 20))
                        
                        Text("\(score2)")
                            .font(.custom("",size: 58))
                        
                    }.padding(.trailing, 30)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
