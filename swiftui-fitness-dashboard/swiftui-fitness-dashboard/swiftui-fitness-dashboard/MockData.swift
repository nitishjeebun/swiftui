//
//  MockData.swift
//  swiftui-fitness-dashboard
//
//  Created by Huy D. on 10/26/20.
//

import SwiftUI

let workout_Data = [
    Daily(id: 0, day: "Day 1", workout_In_Min: 480),
    Daily(id: 1, day: "Day 2", workout_In_Min: 880),
    Daily(id: 2, day: "Day 3", workout_In_Min: 250),
    Daily(id: 3, day: "Day 4", workout_In_Min: 360),
    Daily(id: 4, day: "Day 5", workout_In_Min: 1220),
    Daily(id: 5, day: "Day 6", workout_In_Min: 750),
    Daily(id: 6, day: "Day 7", workout_In_Min: 950)
]

let stats_Data = [
    Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color("running")),
    Stats(id: 1, title: "Water", currentData: 3.5, goal: 5, color: Color("water")),
    Stats(id: 2, title: "Energy Burn", currentData: 585, goal: 1000, color: Color("energy")),
    Stats(id: 3, title: "Sleep", currentData: 6.2, goal: 10, color: Color("sleep")),
    Stats(id: 4, title: "Cycling", currentData: 12.5, goal: 25, color: Color("cycle")),
    Stats(id: 5, title: "Steps", currentData: 16889, goal: 20000, color: Color("steps")),
]

