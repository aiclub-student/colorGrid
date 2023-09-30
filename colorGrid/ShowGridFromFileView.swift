//
//  ShowGridFromFileView.swift
//  colorGrid
//
//  Created by Amit Gupta on 9/16/23.
//

import SwiftUI

struct ShowGridFromFileView: View {
    @StateObject var viewModel = GridViewModel()
    let csvUrl="https://docs.google.com/spreadsheets/d/e/2PACX-1vQZvm9w8HmY-BNwAXYVo_paxreUqUSN975Je7rfUWEC1BkVv-ZOtl7LroIrHJMxwf3ME3nHmAKCrhVR/pub?gid=0&single=true&output=csv"
    
    var body: some View {
        //ScrollView {
            VStack(spacing: 0) {
                Text("From file").font(.system(size: 40))
                Spacer()
                Text("Model 1").font(.system(size: 30))
                ForEach(0..<viewModel.gridSize, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.gridSize, id: \.self) { column in
                            Rectangle()
                                //.fill(colorForNumber(number: viewModel.grid[row][column]))
                                .fill(colorForCell(id: 1, row: row, column: column))
                                .frame(width: 2, height: 2)
                        }
                    }
                }
                Spacer()
                Text("Model 2").font(.system(size: 30))
                ForEach(0..<viewModel.gridSize, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.gridSize, id: \.self) { column in
                            Rectangle()
                                //.fill(colorForNumber(number: viewModel.grid[row][column]))
                                .fill(colorForCell(id: 2, row: row, column: column))
                                .frame(width: 2, height: 2)
                        }
                    }
                }
                Spacer()
                Text("Model 3").font(.system(size: 30))
                ForEach(0..<viewModel.gridSize, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.gridSize, id: \.self) { column in
                            Rectangle()
                                //.fill(colorForNumber(number: viewModel.grid[row][column]))
                                .fill(colorForCell(id: 3, row: row, column: column))
                                .frame(width: 2, height: 2)
                        }
                    }
                }
            }
        //}
        .onAppear {
            viewModel.fetchGridData(from: csvUrl)
        }
    }
    
    func colorForNumber(number: Int) -> Color {
        switch number {
        case 1: return .red
        case 2: return .green
        case 3: return .blue
        default: return .black
        }
    }
    
    func colorForCell(id:Int, row: Int, column:Int) -> Color {
        if !viewModel.initialized {
            return .orange
        }
        //print("Fetching color for cell for row \(row) column \(column) initialized \(viewModel.initialized)")
        switch(id){
        case 1:
            return colorForNumber(number: viewModel.grid1[row][column])
        case 2:
            return colorForNumber(number: viewModel.grid2[row][column])
        case 3:
            return colorForNumber(number: viewModel.grid3[row][column])
        default:
            return .orange
        }
        
    }
}


struct ShowGridFromFileView_Previews: PreviewProvider {
    static var previews: some View {
        ShowGridFromFileView()
    }
}
