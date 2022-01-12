//
//  Round.swift
//  GolfStats
//
//  Created by John DaCorte on 1/8/22.
//

import Foundation

class Round: ObservableObject {
    @Published var hole = [HoleResult]() {
        didSet {
            print("round updated")
        }
    }
    var id = UUID()
    var date: Date
    
    init () {
        self.date = Date()
        let firstHole = HoleResult(number: 5, fairwayHit: "", penalty: 0, putts: 2, score: 6, par: 5)
        self.hole.append(firstHole)
        let secondHole = HoleResult(number: 6, fairwayHit: "", penalty: 0, putts: 2, score: 5, par: 4)
        self.hole.append(secondHole)

        print(hole[0])
        print(hole[1])
    }
}
