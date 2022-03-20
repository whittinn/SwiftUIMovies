//
//  ContentView.swift
//  SwiftUIMovies
//
//  Created by Nathaniel Whittington on 3/20/22.
//



import SwiftUI

struct ContentView: View {
     @State private var text = ""
    @ObservedObject var vm = ViewModel()
    var body: some View {
        NavigationView{
            VStack{
                List(vm.getArr()){ mov in
                    Text(mov.title ?? "")
                }
            
        
            }
            .navigationTitle("Movies")
            .searchable(text: $text).onChange(of: text) { newValue in
                vm.fetchSingleMovie(with: text)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
