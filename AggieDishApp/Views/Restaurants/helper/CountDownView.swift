//
//  CountDownView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/4/22.
//  Inspired by: https://marcgg.com/blog/2020/05/06/circular-progressbar-clock-swiftui/

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var openTime: String
    var amOrPm: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 12)
                )
            VStack {
                Text("Opens")
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(openTime)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(amOrPm)
                    .textCase(.uppercase)
                    .font(.subheadline.weight(.regular))
            }
        }
        
    }
}

struct CountDownClock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        
        VStack {
            if (completed(countTo: countTo, counter: counter)) {
                Text("Open")
                    .font(.title2)
                    .fontWeight(.semibold)
            } else if (counterToMinutes() > 5) {
                Text("Opens in")
                    .font(.subheadline)
                    .fontWeight(.regular)
                Text(String(counterToMinutes()))
                    .font(.title2)
                    .fontWeight(.bold)
                Text("min")
                    .font(.subheadline)
                    .fontWeight(.regular)
            } else {
                Text(String(counterToMinutes()))
                    .font(.title2)
                    .fontWeight(.bold)
                Text("min left")
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
        }
    }
    
    func counterToMinutes() -> Int {
        let currentTime = countTo - counter
        let minutes = Int(currentTime / 60)
        return minutes
    }
}

struct ProgressTrack: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 100, height: 100)
            .overlay(
                Circle()
                    .stroke((isLessthanFiveMin(countTo: countTo, counter: counter) ? Color.green : Color.red), lineWidth: 12)
            )
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    let lightRed: Color = Color(red: 255 / 255, green: 204 / 255, blue: 203 / 255)
    let lightGreen: Color = Color(red: 227 / 255, green: 251 / 255, blue: 227 / 255)
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 100, height: 100)
            .overlay(
                Circle().trim(from:0, to: progress(countTo: countTo, counter: counter))
                        .stroke(
                                style: StrokeStyle(
                                    lineWidth: 12
                                )
                        )
                        .foregroundColor(
                            (isLessthanFiveMin(countTo: countTo, counter: counter) ? (completed(countTo: countTo, counter: counter) ? Color.green : lightGreen) : lightRed)
                        )
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(Animation.easeInOut(duration: 0.2), value: 10)
            )
    }
}

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrack(counter: counter, countTo: countTo)
                ProgressBar(counter: counter, countTo: countTo)
                CountDownClock(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}


func isLessthanFiveMin(countTo: Int, counter: Int) -> Bool {
    let currentTime = countTo - counter
    let minutes = Int(currentTime / 60)
    if (minutes <= 5) {
        return true
    }
    return false
}

func completed(countTo: Int, counter: Int) -> Bool {
    return progress(countTo: countTo, counter: counter) == 1
}

func progress(countTo: Int, counter: Int) -> CGFloat {
    return (CGFloat(counter) / CGFloat(countTo))
}


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        Clock(openTime: "8:15", amOrPm: "AM")
    }
}
