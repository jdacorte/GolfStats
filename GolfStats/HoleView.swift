//
//  HoleView.swift
//  GolfStats
//
//  Created by John DaCorte on 1/8/22.
//

import SwiftUI

struct HoleView: View {
    @ObservedObject var course: Course
    @ObservedObject var round: Round
    var holeIndex: Int
    
    @State private var fairwayChoiceIndex = 1
    @State private var fairwayChoices = ["❌", "", "✅"]
    @State private var curHole = 0
    @State private var tempResult = HoleResult()
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    let curHole = round.hole.count > 1 ? round.hole[round.hole.count - 1].number : 1
                    Image(systemName: "\(curHole).square")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                    VStack {
                        Text("Par \(course.holeSpecs[curHole].par)")
                        Text("\(course.holeSpecs[curHole].yards) Yards")
                        Text("HCP \(course.holeSpecs[curHole].HCP)")
                            .padding(.bottom)
                    }
                }
                
                Text("Score: \(course.holeSpecs[curHole].par)")
                    .font(.custom("Ariel", size: 30))
                
                
                Group {
                    
                    Text("Fairway " + fairwayChoices[fairwayChoiceIndex])
                    Text("Penalty \(round.hole[holeIndex].penalty)")
                    let GIR = round.hole[holeIndex].score - round.hole[holeIndex].putts <= round.hole[holeIndex].par - 2 ? "✅": "❌"
                    Text("Green in Regulation: " + GIR)
                    Text("Putts \(round.hole[holeIndex].putts)")
                    
                }
                Spacer()
                
                Button {
                    print("cur hole is \(curHole)")
                } label: {
                    Text("save")
                }
                HStack {
                    VStack {
                        Text("Hole")
                            .font(.custom("Ariel", size: 12))
                        Button {
                            print("Hole + pressed")
                            round.hole[holeIndex].number = adjustInput(input: "hole", currentValue: round.hole[holeIndex].number, adjustment: 1)
                            print(round.hole[holeIndex])
                        } label: {
                            Image(systemName: "arrow.up.square.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                        }
                        Button {
                            print("Hole - pressed")
                            round.hole[holeIndex].number = adjustInput(input: "hole", currentValue: round.hole[holeIndex].number, adjustment: -1)
                            print(course.holeSpecs[1])
                            
                        } label: {
                            Image(systemName: "arrow.down.square.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purple)
                        }
                        .frame(height: 50)
                    }
                    VStack {
                        
                        Text("Score")
                            .font(.custom("Ariel", size: 12))
                            .padding(.bottom)
                        Button {
                            round.hole[holeIndex].score = adjustInput(input: "score", currentValue: round.hole[holeIndex].score, adjustment: 1)
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button {
                            round.hole[holeIndex].score = adjustInput(input: "score", currentValue: round.hole[holeIndex].score, adjustment: -1)
                        } label: {
                            Image(systemName: "minus")
                        }
                        .frame(height: 50)
                    }
                    
                    VStack {
                        Text("Fariway")
                            .font(.custom("Ariel", size: 12))
                            .padding(.bottom)
                        Button {
                            fairwayChoiceIndex = adjustInput(input: "fairway", currentValue: fairwayChoiceIndex, adjustment: 1)
                            print("FWY + pressed")
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button {
                            fairwayChoiceIndex = adjustInput(input: "fairway", currentValue: fairwayChoiceIndex, adjustment: -1)
                            
                            print("FWY - pressed")
                        } label: {
                            Image(systemName: "minus")
                        }
                        .frame(height: 50)
                    }
                    
                    VStack {
                        Text("Penalty")
                            .font(.custom("Ariel", size: 12))
                            .padding(.bottom)
                        Button {
                            round.hole[holeIndex].penalty = adjustInput(input: "penalty", currentValue: round.hole[holeIndex].penalty, adjustment: 1)
                            print("Penalty + pressed")
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button {
                            round.hole[holeIndex].penalty = adjustInput(input: "penalty", currentValue: round.hole[holeIndex].penalty, adjustment: -1)
                            
                            print("Penalty - pressed")
                        } label: {
                            Image(systemName: "minus")
                        }
                        .frame(height: 50)
                    }
                    
                    VStack {
                        Text("Putts")
                            .font(.custom("Ariel", size: 12))
                            .padding(.bottom)
                        Button {
                            round.hole[holeIndex].putts = adjustInput(input: "putts", currentValue: round.hole[holeIndex].putts, adjustment: 1)
                            print("Putts + pressed")
                        } label: {
                            Image(systemName: "plus")
                        }
                        Button {
                            round.hole[holeIndex].putts = adjustInput(input: "putts", currentValue: round.hole[holeIndex].putts, adjustment: -1)
                            
                            print("Putts - pressed")
                        } label: {
                            Image(systemName: "minus")
                        }
                        .frame(height: 50)
                    }
                    
                }
            }
            .onAppear(perform: test)
        }
    }
    
    func adjustInput(input: String, currentValue: Int, adjustment: Int)-> Int {
        var nextInput = currentValue + adjustment
        switch (input) {
        case "hole":
            if nextInput == 0 {
                nextInput = 1
            } else if nextInput > 18 {
                nextInput = 18
            }
            
        case "fairway":
            if nextInput == -1 {
                nextInput = 0
            } else if nextInput > 2 {
                nextInput = 2
            }
            
        case "penalty":
            if nextInput < 0 {
                nextInput = 0
            } else if nextInput > round.hole[holeIndex].score - 2 {
                nextInput = round.hole[holeIndex].score - 2
            }
            
        case "putts":
            if nextInput < 0 {
                nextInput = 0
            } else if nextInput > round.hole[holeIndex].score - 1 {
                nextInput = round.hole[holeIndex].score - 1
            }
            
        case "score":
            if nextInput < 1 {
                nextInput = 1
            } else if nextInput > 10 {
                nextInput = 10
            }
        default:
            nextInput = currentValue
            
        }
        return nextInput
        
        
        
    }
    
}


struct HoleView_Previews: PreviewProvider {
    static var previews: some View {
        HoleView(course: Course(), round: Round(), holeIndex: 0)
    }
}
