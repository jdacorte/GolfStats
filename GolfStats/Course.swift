//
//  Course.swift
//  GolfStats
//
//  Created by John DaCorte on 1/9/22.
//

import Foundation

class Course: ObservableObject {
    var name: String
    var location: String
    var totalHoles: Int
    var totalYards: Int
    var rating: Double
    var slope: Double
    var holeSpecs: [HoleSpec]
    
    init() {
        self.name = "Kebo"
        self.location = "Bar Harbor, ME"
        self.totalHoles = 18
        self.totalYards = 5906
        self.rating = 69.4
        self.slope = 121.0
        self.holeSpecs = []
        var hole = HoleSpec(tee: "white", number: 0, par: 0, yards: 0, HCP: 0)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 1, par: 4, yards: 382, HCP: 7)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 2, par: 4, yards: 432, HCP: 3)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 3, par: 4, yards: 327, HCP: 11)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 4, par: 3, yards: 150, HCP: 15)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 5, par: 5, yards: 519, HCP: 13)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 6, par: 3, yards: 170, HCP: 9)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 7, par: 4, yards: 320, HCP: 17)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 8, par: 4, yards: 432, HCP: 1)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 9, par: 3, yards: 186, HCP: 5)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 10, par: 4, yards: 331, HCP: 10)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 11, par: 4, yards: 394, HCP: 6)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 12, par: 4, yards: 285, HCP: 14)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 13, par: 4, yards: 388, HCP: 4)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 14, par: 5, yards: 510, HCP: 8)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 15, par: 3, yards: 147, HCP: 16)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 16, par: 4, yards: 264, HCP: 18)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 17, par: 4, yards: 341, HCP: 2)
        self.holeSpecs.append(hole)
        hole = HoleSpec(tee: "white", number: 18, par: 4, yards: 328, HCP: 12)
        self.holeSpecs.append(hole)
    }
}


