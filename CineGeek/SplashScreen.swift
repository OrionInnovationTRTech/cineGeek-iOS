//
//  SplashScreen.swift
//  CineGeek
//
//  Created by Berkay YILDIRIM on 17.05.2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.yellow.ignoresSafeArea()
            
                VStack {
                    Image(systemName: "")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    Text("CineGeek")
                        .font(Font.custom("Baskerville-Bold", size: 56))
                        .foregroundColor(.black.opacity(0.80))
                       
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
