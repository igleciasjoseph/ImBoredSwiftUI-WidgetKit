//
//  CategoryTabView.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import SwiftUI

struct CategoryTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            ActivityCard()
                .tabItem {
                    Label("Random Activity", systemImage: "arrow.2.circlepath")
                }
            
            CategoryGridView()
                .tabItem {
                    Label("Select Category", systemImage: "list.bullet.rectangle")
                }
        }
        .accentColor(.mint)
    }
    
}

#Preview {
    CategoryTabView()
}
