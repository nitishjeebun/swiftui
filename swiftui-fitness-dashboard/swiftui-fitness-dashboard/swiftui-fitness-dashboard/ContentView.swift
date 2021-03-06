//
//  ContentView.swift
//  swiftui-fitness-dashboard
//
//  Created by Huy D. on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var selected = 0
    var colors = [Color("Color1"),Color("Color")]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // Bar Chart
                HStack {
                    Text("Hello World")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                VStack(alignment: .leading, spacing: 25) {
                    Text("Daily Wirkout in Hrs")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack(spacing: 15) {
                        ForEach(workout_Data) { work in
                            VStack {
                                VStack {
                                    Spacer(minLength: 0)
                                    if selected == work.id {
                                        Text(getHrs(value: work.workout_In_Min))
                                            .foregroundColor(Color("Color"))
                                            .padding(.bottom, 5)
                                    }
                                    RoundedShape()
                                        .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                        .frame(height: getHeight(value: work.workout_In_Min))
                                }
                                .frame(height: 220)
                                .onTapGesture {
                                    withAnimation(.easeOut) {
                                        selected = work.id
                                    }
                                }
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }

                }
                .padding()
                .background(Color.white.opacity(0.06))
                .cornerRadius(10)
                .padding()
                // Rings Chart - Stats Grid
                HStack {
                    Text("Statistics")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(stats_Data) { stat in
                        VStack(spacing: 22) {
                            HStack {
                                Text(stat.title)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer(minLength: 0)
                            }
                            ZStack {
                                let ringWidth = (UIScreen.main.bounds.width - 150) / 2
                                Circle()
                                    .trim(from: 0, to: 1)
                                    .stroke(stat.color.opacity(0.05), lineWidth: 10)
                                    .frame(width: ringWidth, height: ringWidth)
                                Circle()
                                    .trim(from: 0, to: (stat.currentData / stat.goal))
                                    .stroke(stat.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                    .frame(width: ringWidth, height: ringWidth)
                                    .rotationEffect(.init(degrees: -90))
                                Text(getPercent(current: stat.currentData, Goal: stat.goal) + " %")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                            Text(getDec(val: stat.currentData) + getType(val: stat.title))
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.white.opacity(0.06))
                        .cornerRadius(15)
                        .shadow(color: Color.white.opacity(0.1), radius: 10, x: 0, y: 0)
                    }
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
}

// Helper function
extension Home {
    
    func getType(val: String)->String{
        switch val {
        case "Water": return "L"
        case "Sleep": return "Hrs"
        case "Running": return "Km"
        case "Cycling": return "Km"
        case "Steps": return "stp"
        default: return "Kcal"
        }
    }
    
    
    // converting Number to decimal...
    func getDec(val: CGFloat)->String{
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
    
    
    // calculating percent...
    func getPercent(current : CGFloat,Goal : CGFloat)->String{
        let per = (current / Goal) * 100
        return String(format: "%.1f", per)
    }
    
    
    // calculating Hrs For Height...
    func getHeight(value : CGFloat)->CGFloat{
        // the value in minutes....
        // 24 hrs in min = 1440
        let hrs = CGFloat(value / 1440) * 200
        return hrs
    }
    
    
    // getting hrs...
    func getHrs(value: CGFloat)->String{
        let hrs = value / 60
        return String(format: "%.1f", hrs)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
