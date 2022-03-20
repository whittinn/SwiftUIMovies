//
//  APIHandler.swift
//  SwiftUIMovie
//
//  Created by Nathaniel Whittington on 3/19/22.
//

import Foundation
class APIHandler {
    static let shared = APIHandler()
    private init () {}
    
    public func fetchMovie(movieTile:String, completion:@escaping (Result<Data,Error>)->Void){
        
        
        guard let queryResult = URL(string: "\(Constant.baseURL.rawValue)\(Constant.apiKey.rawValue)\(movieTile)") else {return}
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: queryResult) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
              completion(.success(data))
            }
        }.resume()
    }
    
}
