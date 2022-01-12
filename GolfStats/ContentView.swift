//
//  ContentView.swift
//  GolfStats
//
//  Created by John DaCorte on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var round = Round()
    @StateObject var course = Course()
   
    var body: some View {
        NavigationView {
       
            HoleView(course: course, round: round, holeIndex: 1)
        }
        .onAppear(perform: { print("starting content view") })
            
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
