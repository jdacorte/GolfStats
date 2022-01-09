//
//  ContentView.swift
//  GolfStats
//
//  Created by John DaCorte on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var round = Round()
   
    var body: some View {
        
        HoleView(round: round, holeIndex: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
