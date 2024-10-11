//
//  APIService.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import Foundation

class APIService {
    
    func fetchRandomActivity() async throws -> Activity {
        
        let randomEndpoint : String = "https://bored-api.appbrewery.com/random"
        
        guard let url = URL(string: randomEndpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            
            let activity = try JSONDecoder().decode(Activity.self, from: data)
            
            return activity
            
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
    func fetchCategoryActivity(category: Category) async throws -> [Activity] {
        
        let categoryEndpoint : String = "https://bored-api.appbrewery.com/filter?type=\(category)"
        
        guard let url = URL(string: categoryEndpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            
            let activity = try JSONDecoder().decode([Activity].self, from: data)
            
            return activity
            
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
}
