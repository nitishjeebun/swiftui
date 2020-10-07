//
//  Fitness.swift
//  swiftui-dashboard-grids
//
//  Created by Huy D. on 10/7/20.
//

import Foundation

struct Fitness : Identifiable {
    var id : Int
    var title : String
    var image : String
    var data: String
    var suggest : String
}

var fit_Data = [
    
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "124 bpm", suggest: "80-120\nHealthy"),

    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 43m", suggest: "Deep Sleep\n5h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal\n900 kcal"),
            
    Fitness(id: 3, title: "Steps", image: "steps", data: "16,741", suggest: "Daily Goal\n20,000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "5.3 km", suggest: "Daily Goal\n10 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Daily Goal\n20 km"),
]

var week_Fit_Data = [

    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "84 bpm", suggest: "80-120\nHealthy"),

    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "Deep Sleep\n26h 13m"),
    
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal\n4,800 kcal"),
            
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Weekly Goal\n25,0000 Steps"),
    
    Fitness(id: 4, title: "Running", image: "running", data: "45.3 km", suggest: "Weekly Goal\n70 km"),
    
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "100.3 km", suggest: "Weekly Goal\n125 km"),
]

