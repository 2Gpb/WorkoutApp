//
//  APIManager.swift
//  WorkoutApp
//
//  Created by Peter on 16.12.2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://newsdata.io/api/1/news?apikey=pub_34933f208d9d0750e3b9d942568bbf8f4610d&q=pegasus&language=en"
    
    func getNews(completion: @escaping ([Result]) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            
            if let newsData = try? JSONDecoder().decode(NewsData.self, from: data) {
                completion(newsData.results)
            } else {
                print("fail")
                completion([])
            }
        }
        task.resume()
    }
}
