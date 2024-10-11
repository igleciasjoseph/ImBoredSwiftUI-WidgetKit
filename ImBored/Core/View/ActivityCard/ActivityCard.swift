//
//  RandomCard.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import SwiftUI

struct ActivityCard: View {
    @StateObject private var viewModel = ActivityViewModel()
    
    var body: some View {
        VStack {
            Text("What To Do When You're Bored")
                .padding(.top)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
            
            Spacer()
            
            if viewModel.isLoading {
                ProgressView("Loading A Random Activity...")
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .shadow(radius: 10)
                    
                    VStack {
                        Text("\(viewModel.activity?.activity ?? "No Activity Available, Check Back Later")")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        Spacer()
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Type: \(viewModel.activity?.type.capitalizingFirstLetter() ?? "No Type Available")")
                                .font(.title)
                                .foregroundStyle(.mint)
                                .multilineTextAlignment(.leading)
                            if viewModel.activity?.kidFriendly == nil {
                                Text("Kid Friendly : Not Available")
                                    .font(.title)
                                    .foregroundStyle(.mint)
                                    .multilineTextAlignment(.leading)
                            } else {
                                Text("Kid Friendly : \(viewModel.activity?.kidFriendly ?? false ? "Yes" : "No")")
                                    .font(.title)
                                    .foregroundStyle(.mint)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    .padding(20)
                    .multilineTextAlignment(.center)
                }
                .frame(width: 350, height: 450)
            }
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.loadActivity()
                }
            } label: {
                Text("Click To Refresh!")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
            }
            .padding(10)
            .background(.black)
            .clipShape(Capsule())
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.ignoresSafeArea())
        .task {
            if viewModel.activity == nil {
                await viewModel.loadActivity()
            }
        }
        .transition(.slide)
    }
}

#Preview {
    ActivityCard()
}
