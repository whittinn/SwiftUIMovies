//
//  ViewModel.swift
//  SwiftUIMovie
//
//  Created by Nathaniel Whittington on 3/19/22.
//

import Foundation

//Use with class to store data, used to store inside a view and listens for changes to @published.
class ViewModel: ObservableObject  {
    
    
    //Publish automatically announces when changes occur and updates.
    @Published private var arr = [Movie]()
    
    typealias GetMovie = ((Movie)->())?
    
    
    func fetchSingleMovie(with name:String){
        let safeName = name.replacingOccurrences(of: " ", with: "+")
        APIHandler.shared.fetchMovie(movieTile: safeName) { [weak self] data in
            guard let strongSelf = self else {return}
            switch data{
            case .success(let movies):
                
                do {
                    let arr =  try JSONDecoder().decode(MoviePages.self, from: movies)
                    guard let movie = arr.results else {return}
                    strongSelf.setArr(arr: movie)
                    print("Successfully returned movies")
                    
                } catch let error {
                    print(error)
                }
            case .failure:
                print("Failed to grab movie data")
            }
        }
    }
    
    func setArr(arr:[Movie]){
        self.arr = arr
    }
    
    func getArr()->[Movie]{
        return arr
    }
    
    func getArrCount()->Int{
        return arr.count
    }
    
    func getSingleArr(index:Int)->Movie{
        return arr[index]
    }
    
    func getArrTitle(index:Int)->String?{
        return getSingleArr(index: index).title ?? "NA"
    }
    
    
}
