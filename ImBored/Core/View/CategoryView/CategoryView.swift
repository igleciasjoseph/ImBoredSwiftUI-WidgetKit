//
//  CategoryView.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    @StateObject var viewModel = ActivityViewModel()
    @State private var contentVisible = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading Activities...")
                    .transition(.opacity)
            } else if viewModel.activities.isEmpty {
                Text("No Activities Available For This Category.")
                    .font(.title)
                    .foregroundStyle(.gray)
                    .padding()
                    .transition(.opacity)
            } else {
                ScrollView(.vertical) {
                    ForEach(viewModel.activities) { activity in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.black)
                                .shadow(radius: 10)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text(activity.activity)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Type: \(activity.type.capitalizingFirstLetter())")
                                        .font(.headline)
                                        .foregroundColor(.mint)
                                    Text("Kid Friendly : \(activity.kidFriendly ? "Yes" : "No")")
                                        .font(.headline)
                                        .foregroundColor(.mint)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(20)
                        }
                        .frame(width: 350, height: 250)
                        .padding(.vertical, 10)
                    }
                }
                .padding(.horizontal)
                .opacity(contentVisible ? 1 : 0)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.3)) {
                        contentVisible = true
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
        .task {
            if viewModel.activities.isEmpty {
                await viewModel.loadCategoryActivity(category: category)
            }
        }
    }
}

#Preview {
    CategoryView(category: .busywork)
}
