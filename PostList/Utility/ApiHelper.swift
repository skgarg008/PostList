//
//  ApiHelper.swift
//  PostList
//
//  Created by Sajan Kumar on 28/05/24.
//

import Foundation

class ApiHelper {
    
    //MARK:- ====== Variables ======
    var baseURL: URLComponents!
    
    //MARK:- ====== Life Cycle ======
    init(_ url: String) {
        self.baseURL = URLComponents(string: url)!
    }
    
    //MARK:- ====== Functions ======
    func fetchList(page: Int = 1, completionHandler: @escaping (Result<[Post], Error>) -> Void)  {
        let queryItems = [
            URLQueryItem(name: "_page", value: "\(page)"),
            URLQueryItem(name: "_limit", value: "10")
        ]

        baseURL.queryItems = queryItems
        guard let url = baseURL.url  else {
            fatalError("Url is not valid")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {
            data, responceURL, error in
            
            guard let data = data else {
                //ERROR
                guard let error = error else { return }
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            let list: [Post]? = try? JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completionHandler(.success(list ?? []))
            }
        }.resume()
    }
}
