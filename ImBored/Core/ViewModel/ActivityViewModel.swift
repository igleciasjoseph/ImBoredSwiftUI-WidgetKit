//
//  ActivityViewModel.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import Foundation

@MainActor
class ActivityViewModel: ObservableObject {
    
    @Published var activity: Activity?
    @Published var activities: [Activity] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let apiService = APIService()
    let category: Category
    
    init(category: Category = .education) {
        self.category = category
    }
    
    func loadActivity() async {
        isLoading = true
        do {
            let fetchedActivity = try await apiService.fetchRandomActivity()
            activity = fetchedActivity
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func loadCategoryActivity(category: Category) async {
        isLoading = true
        do {
            let fetchedActivities = try await apiService.fetchCategoryActivity(category: category)
            activities = fetchedActivities
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
