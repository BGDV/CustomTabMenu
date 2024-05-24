//
//  ContentView.swift
//  CustomTabMenu
//
//  Created by BGDV on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    private var width = UIScreen.main.bounds.width
    private var height = UIScreen.main.bounds.height
    
    @State private var currentTab = 1
    
    func getSizeForIcon() -> CGFloat {
        var currentSize = CGFloat(0)
        if width / height > 0.6 {
            currentSize = width / 12
        } else if width / height < 0.6 {
            currentSize = width / 8.8
        }
        return currentSize
    }
    
    func getSizeForBarLine() -> CGFloat {
        var currentSize = CGFloat(0)
        if width / height > 0.6 {
            currentSize = height / 18
        } else if width / height < 0.6 {
            currentSize = height / 14
        }
        return currentSize
    }
    
    @ViewBuilder
    func tabItem(imageName: String, screenName: String, numberTab: Int) -> some View {
        
        VStack{
            if currentTab == numberTab {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(currentTab == numberTab ? Color.init(red: 0.282, green: 0.776, blue: 0.761) : .clear)
                        .frame(width: getSizeForIcon(), height: getSizeForIcon())
                    
                    Image(systemName: imageName)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                    
                }
                .offset(y: -6)
                .transition(
                    withAnimation(.spring()) {
                        .offset(y: 17)
                    }
                )
                .animation(.default)
            } else {
                Image(systemName: imageName)
                    .font(.system(size: 25))
                
            }
            Text(screenName)
                .padding(.top, 1)
                .font(.caption)
            
        }
        .foregroundColor(currentTab == numberTab ? Color.init(red: 0.282, green: 0.776, blue: 0.761) : Color.white)
        .onTapGesture {
            withAnimation(.spring()) {
                currentTab = numberTab
            }
        }
        
        
    }
    
    var body: some View {
        GeometryReader { g in
            
            VStack {
                
                switch currentTab {
                case 1:
                    ScreenOne()
                case 2:
                    ScreenTwo()
                case 3:
                    ScreenThree()
                case 4:
                    ScreenFour()
                default:
                    ScreenOne()
                }
                
                Spacer()
                HStack() {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .trim(from: 0.5, to: 1)
                            .stroke(lineWidth: 6)
                            .foregroundColor(Color.init(red: 0.282, green: 0.776, blue: 0.761))
                            .frame(width: g.size.width, height: getSizeForBarLine())
                        
                        HStack(alignment: .bottom) {
                            Spacer()
                            
                            tabItem(imageName: "house", screenName: "ScreenOne", numberTab: 1)
                            
                            Spacer()
                            
                            tabItem(imageName: "book", screenName: "ScreenTwo", numberTab: 2)
                            
                            Spacer()
                            
                            tabItem(imageName: "book.closed", screenName: "ScreenThree", numberTab: 3)
                            
                            Spacer()
                            
                            tabItem(imageName: "person.crop.circle", screenName: "ScreenFour", numberTab: 4)
                            
                            Spacer()
                        }
                    }
                }
            }
            .background(Color.init(red: 0.286, green: 0.283, blue: 0.263))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
