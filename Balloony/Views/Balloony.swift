//
//  Balloony.swift
//  Balloony
//
//  Created by Wind Versi on 25/5/22.
//

import SwiftUI

enum ScreenContent {
    case splash
    case main
}

struct Balloony: View {
    // MARK: - Properties
    @EnvironmentObject var balloonModelData: BalloonModelData
    @State private var content: ScreenContent = .splash

    // MARK: - Body
    var body: some View {
        ZStack {
            
            // Layer content for smoother transition
            // Layer 1: SPLASH
            SplashView(content: $content)
                .zIndex(0)
            
            // Layer 2: MAIN
            if content == .main {
                
                MainView()
                    .zIndex(1)
                    .transition(
                        .opacity.animation(
                            .easeOut(duration: 0.5)
                        )
                    )
                
            } //: if
            
            // Layer 3: MENU
            if balloonModelData.isMenuShown {
                
                GeometryReader { geometry in
                    
                    LinearGradient(
                        colors: [
                            Colors.background2.color.opacity(0.5),
                            Colors.background.color
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                    Color.black.opacity(0.65)
                        .fillMaxSize()
                        .onTapGesture(perform: balloonModelData.hideMenu)
                    
                    MenuView(selectMenu: selectMenuAction)
                    
                } //: GeometryReader
                .zIndex(2)
                .fillMaxWidth(alignment: .leading)
                
            } //: if
            
            
        } //: ZStack
    }
    
    // MARK: - Actions
    func selectMenuAction(_ menu: MenuItem) {
        withAnimation(.spring) {
            balloonModelData.hideMenu()
        }
    }
}

// MARK: - Preview
struct Balloony_Previews: PreviewProvider {
    static var previews: some View {
        Balloony()
            .environmentObject(BalloonModelData())
            .ignoresSafeArea()
            .background(Colors.background.color)
    }
}
