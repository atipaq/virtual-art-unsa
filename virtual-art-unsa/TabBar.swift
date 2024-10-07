//
//  TabBar.swift
//  virtual-art-unsa
//
//  Created by Alex Huaracha on 6/10/24.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    let icon = RiveViewModel(fileName: "icons_mod", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")
    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding(12)
            .background(Color.black.opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 20, x:0, y:20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors:[.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint:.bottomTrailing))
            )
            .padding(.horizontal, 25)
        }
    }
    
    var content: some View {
        ForEach(tabItems) { item in
            Button {
                try? item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    try? item.icon.setInput("active", value: false)
                }
            } label: {
                item.icon.view()
                    .frame(height:36)
            }
        }
    }
}

// Objeto Item
struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
}

// Lista de Items
var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons_mod", stateMachineName: "State Machine 1", artboardName: "MENU")),
    TabItem(icon: RiveViewModel(fileName: "icons_mod", stateMachineName: "State Machine 1", artboardName: "DASHBOARD")),
    TabItem(icon: RiveViewModel(fileName: "icons_mod", stateMachineName: "USER_Interactivity", artboardName: "USER")),
    TabItem(icon: RiveViewModel(fileName: "icons_mod", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")),
]

#Preview {
    TabBar()
}
