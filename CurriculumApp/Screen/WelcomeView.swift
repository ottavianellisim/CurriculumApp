//
//  WelcomeView.swift
//  CurriculumApp
//
//  Created by Simone Ottavianelli on 30/03/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var draggedOffset = CGSize.zero
    @State private var animate: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Text("I can do all things..")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .opacity(0.0 - (draggedOffset.height * 0.002))
                }
                VStack {
                    Spacer()
                    Text("Ciao, sono Simone")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .opacity(1.0 + (draggedOffset.height * 0.005))
                    HStack {
                        Spacer()
                        Text("iOS Developer")
                            .foregroundColor(.white)
                            .padding()
                            .offset(x: -40, y: -40)
                            .opacity(1.0 + (draggedOffset.height * 0.005))
                    }
                    Spacer()
                    SwipeToUnlockView(animate: $animate, color: .white)
                        .offset(y: animate ? -15 : 0)
                        .opacity(1.0 + (draggedOffset.height * 0.005))
                }
            }
            .onAppear {
                animate.toggle()
            }
            .offset(y: self.draggedOffset.height)
            .animation(.linear.speed(0.6), value: draggedOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.draggedOffset = value.translation
                        
                        if self.draggedOffset.height > 100 {
                            self.draggedOffset = .zero
                        }
                        
                        if -(self.draggedOffset.height) > geo.size.height / 2 {
                            self.draggedOffset.height = -geo.size.height
                        }
                    }
                    .onEnded { value in
                        if -(self.draggedOffset.height) > 100 {
                            self.draggedOffset.height = -geo.size.height
                        }
                        
                        if -(self.draggedOffset.height) < 100 {
                            self.draggedOffset = .zero
                        }
                    }
            )
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
