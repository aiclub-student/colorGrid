//
//  ContentView.swift
//  colorGrid
//
//  Created by Amit Gupta on 9/16/23.
//

import SwiftUI

import SwiftUI

struct BasicGridView: View {
    let grid: [[Int]]
    let gridSize = 64
    
    init() {
        var tempGrid = [[Int]]()
        for _ in 0..<gridSize {
            var row = [Int]()
            for _ in 0..<gridSize {
                row.append(Int.random(in: 1...3))
            }
            tempGrid.append(row)
        }
        self.grid = tempGrid
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<gridSize, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<gridSize, id: \.self) { column in
                            Rectangle()
                                .fill(colorForNumber(number: grid[row][column]))
                                .frame(width: 3, height: 3) // adjust frame size as necessary
                        }
                    }
                }
            }
        }
    }
    
    func colorForNumber(number: Int) -> Color {
        switch number {
        case 1: return .red
        case 2: return .green
        case 3: return .blue
        default: return .black // just in case
        }
    }
}



