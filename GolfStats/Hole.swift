//
//  Hole.swift
//  GolfStats
//
//  Created by John DaCorte on 1/8/22.
//

import Foundation

struct HoleData: Identifiable, Equatable {
    var id = UUID()
    var number = 0
    var fairwayHit = ""
    var penalty = 0
    var putts = 0
    var score = 0
    var par = 4
}
