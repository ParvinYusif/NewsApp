//
//  APICaller.swift
//  NewsApp
//
//  Created by pervın on 03.06.23.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=Nxs16JgGZBFSHPAxaD6CH6K7oOmHkwO9")
    }
    private init() {}
    
    public func getTopStories(completion: @escaping(Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func getSearchItems(text: String, completion: @escaping(Result<Search, Error>) -> Void) {
        let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json" + "?q=\(text)&api-key=Nxs16JgGZBFSHPAxaD6CH6K7oOmHkwO9")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(Search.self, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}


