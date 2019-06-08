//
//  main.swift
//  onePersonChess
//
//  Created by Razieh Taraghi Delgarm on 6/2/19.
//  Copyright © 2019 Code Hospital. All rights reserved.
//

import Foundation

let sBLOCK = "🏜"
let sEMPTY = "⌨️"
let sPIECE = "🏠"

let BLOCK = 1
let EMPTY = 2
let PIECE = 3

let number2string = [
  BLOCK: sBLOCK,
  EMPTY: sEMPTY,
  PIECE: sPIECE
]

typealias Piece = Int
typealias Table = Array<Array<Piece>>

struct Board {
  let table:Table
  let path:String
}

let directions = [[1,0], [0,1],[-1,0],[0,-1]]

let initialBoard = Board(table:   [
  [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
  [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
  
  [PIECE, PIECE, PIECE, PIECE, PIECE, PIECE, PIECE],
  [PIECE, PIECE, PIECE, EMPTY, PIECE, PIECE, PIECE],
  [PIECE, PIECE, PIECE, PIECE, PIECE, PIECE, PIECE],
  
  [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
  [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
  ]
, path: "")

var boards = [
  initialBoard
]

func print_board(board:Board) -> Void {
  if board.path != "" {
    print("Path: \(board.path)")
  }
  print(
    board.table
      .map{
        $0
          .map{number2string[$0]!}
          .joined(separator: "")
        
      }.joined(separator: "\n")
  )
  print("\n")
}

func print_boards(boards:[Board]) -> Void {
  print("Printing \(boards.count) boards:\n")
  for board in boards {
    print_board(board: board)
  }
  print(boards.count , " boards printed\n")
}

let N = 7

func inRange(index: Int) -> Bool {
  return 0<index && index<N;
}

func unique_duplicates(boards: [Board]) -> [Board] {
  var mins = [UInt64]()
  let out_boards = boards.filter {
    let board = $0
    let weights = directions.map({(dir:[Int]) -> UInt64 in
      let x = dir[0]
      let y = dir[1]
      var bits : UInt64 = 0b10000000
      for n in 0...N-1 {
        for m in 0...N-1 {
          let i = x==0
            ? y == -1 ? N-1-n : n
            : x == -1 ? N-1-m : m
          let j = y==0
            ? x == -1 ? N-1-n : n
            : y == -1 ? N-1-m : m
          let step = x==0 ? j : i
          if board.table[i][j] == EMPTY {
            bits = bits | (0b1 << step)
            //            print("empty found at \(i),\(j) bits=\(bits) m=\(m) n=\(n) step=\(step)")
          }
        }
        bits = bits << N
      }
      //      print(String(bits, radix: 2))
      return bits
    })
    for weight in weights {
      if mins.contains(weight) {
        return false
      }
    }
    mins.append(contentsOf: weights)
    return true
  }
  mins.removeAll()
  return out_boards
}

func iterate(in_boards : [Board]) -> [Board] {
  func one_direction(dir:[Int]) -> [Board] {
    let x = dir[0]
    let y = dir[1]
    let directionLetter = x == 0 ? y == 1 ? "R" : "L" : x == 1 ? "U" : "D"
    
    var out_boards : [Board] = []
    for board in in_boards {
      for i in 0...N-1 {
        if inRange(index: i+x*2) {
          for j in 0...N-1 {
            if inRange(index:  j+y*2)  {
              if (board.table[i][j] == PIECE && board.table[i+x][j+y] == PIECE && board.table[i+x*2][j+y*2] == EMPTY) {
                var table = NSArray(array:board.table, copyItems: true) as! Table
                table[i][j] = EMPTY
                table[i+x][j+y] = EMPTY
                table[i+x*2][j+y*2] = PIECE
                let b:Board = Board(table: table, path: "\(board.path)\(j)\(i)\(directionLetter)")
                out_boards.append(b)
              }
            }
          }
        }
      }
    }
    return out_boards
  }
  var out_boards : [Board] = []
  for dir in directions {
    out_boards.append(contentsOf: one_direction(dir: dir))
  }
  boards.removeAll()
  return unique_duplicates(boards: out_boards)
}

let start = CFAbsoluteTimeGetCurrent()
for i in 1...31 {
  let start = CFAbsoluteTimeGetCurrent()
  boards = iterate(in_boards: boards)
  let diff = CFAbsoluteTimeGetCurrent() - start
  print("step \(i) took \(diff) seconds with \(boards.count) boards")
}
print_boards(boards: boards)

let diff = CFAbsoluteTimeGetCurrent() - start
print("\nTotally took \(diff) seconds with \(boards.count) boards")

