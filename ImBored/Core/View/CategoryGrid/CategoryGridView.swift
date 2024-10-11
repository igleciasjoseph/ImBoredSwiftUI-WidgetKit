//
//  CategoryGridView.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import SwiftUI

struct CategoryGridView: View {
    
    let layout = [
        GridItem(.fixed(200))
    ]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: layout, spacing: 25) {
                ForEach(Category.allCases, id: \.self) { category in
                    NavigationLink(destination: CategoryView(category: category)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .shadow(radius: 10)
                            
                            VStack {
                                Text("\(category.rawValue.capitalized)")
                                    .font(.title3)
                                    .foregroundStyle(.white)
                            }
                            .padding(20)
                            .multilineTextAlignment(.center)
                        }
                        .frame(width: 175, height: 75)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
        }
    }
}

#Preview {
    CategoryGridView()
}
