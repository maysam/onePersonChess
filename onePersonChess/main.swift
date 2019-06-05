//
//  main.swift
//  onePersonChess
//
//  Created by Razieh Taraghi Delgarm on 6/2/19.
//  Copyright © 2019 Code Hospital. All rights reserved.
//

import Foundation

let BLOCK = "🏜"
let EMPTY = "⌨️"
let PIECE = "🏠"
let directions = [[1,0], [0,1],[-1,0],[0,-1]]

var boards = [
  [
    [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
    [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],

    [PIECE, PIECE, PIECE, PIECE, PIECE, PIECE, PIECE],
    [PIECE, PIECE, PIECE, EMPTY, PIECE, PIECE, PIECE],
    [PIECE, PIECE, PIECE, PIECE, PIECE, PIECE, PIECE],

    [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
    [BLOCK, BLOCK, PIECE, PIECE, PIECE, BLOCK, BLOCK],
  ]
]

func joinStrings(boxes:Array<String>) -> String {
  return boxes.joined(separator: "")
}

func print_board(board:Array<Array<String>>) -> Void {
  print(board.map({
    (boxes : Array<String>) -> String in return boxes.joined(separator: "")
  }).joined(separator: "\n")
  )
  print("\n")
}

func print_boards(boards:Array<Array<Array<String>>>) -> Void {
  print("Printing boards:\n")
  for board in boards {
    print_board(board: board)
  }
  print(boards.count , " boards printed\n")
}

print_boards(boards: boards)

let N = 7

func inRange(index: Int) -> Bool {
  return 0<index && index<N;
}

func unique_duplicates(boards: Array<Array<Array<String>>>) -> Array<Array<Array<String>>> {
  var mins = [Decimal: Array<Array<String>>]()
  boards.forEach { board in
    let weights = directions.map({(dir:Array<Int>) -> Decimal in
      let x = dir[0]
      let y = dir[1]
      var weight : Decimal = 0
      for n in 0...N-1 {
        var bits : UInt8 = 0b00000000
        for m in 0...N-1 {
          let i = x==0
            ? y == -1 ? N-1-n : n
            : x == -1 ? N-1-m : m // ( x * m + N) % N
          let j = y==0
            ? x == -1 ? N-1-n : n
            : y == -1 ? N-1-m : m // (y * m + N + y) % N
          let step = x==0 ? j : i
          if board[i][j] == EMPTY {
            bits = bits | (0b1 << step)
//            print("empty found at ", i , j, bits, m, n, step)
          }
        }
//        print(n, bits, Int(bits), pow(10, n))
        weight += Decimal(bits) * (pow(10, n))
      }
//      print(weight)
      return weight
    })
//    print(weights)
    let min = weights.min()!
//    print(min)
    mins[min] = board
  }
//  print(mins)
//  boards.removeAll()
  print(mins.keys)
  return Array(mins.values)
//  return boards
}

func iterate(in_boards : Array<Array<Array<String>>>) -> Array<Array<Array<String>>> {
  var out_boards : Array<Array<Array<String>>> = []
  for board in in_boards {
    for dir in directions {
      let x = dir[0]
      let y = dir[1]
      for i in 0...N-1 {
        for j in 0...N-1 {
          if inRange(index: i+x*2) && inRange(index:  j+y*2)  {
            if (board[i][j] == PIECE && board[i+x][j+y] == PIECE && board[i+x*2][j+y*2] == EMPTY) {
              var b:Array<Array<String>> = NSArray(array:board, copyItems: true) as! Array<Array<String>>
              b[i][j] = EMPTY
              b[i+x][j+y] = EMPTY
              b[i+x*2][j+y*2] = PIECE
              out_boards.append(b)
            }
          }
        }
      }
    }
  }
  boards.removeAll()
  return unique_duplicates(boards: out_boards)
}

boards = iterate(in_boards: boards)
print_boards(boards: boards)
boards = iterate(in_boards: boards)

print_boards(boards: boards)
