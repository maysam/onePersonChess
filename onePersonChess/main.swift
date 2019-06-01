//
//  main.swift
//  onePersonChess
//
//  Created by Razieh Taraghi Delgarm on 6/2/19.
//  Copyright © 2019 Code Hospital. All rights reserved.
//

import Foundation

let BLOCK = "x"
let EMPTY = " "
let PIECE = "p"

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
func print_boards(boards:Array<Array<Array<String>>>) -> Void {
  for board in boards {
    print(board.map({
      (boxes : Array<String>) -> String in return boxes.joined(separator: "")
    }).joined(separator: "\n")
    )
    print("\n")
  }
}

print_boards(boards: boards)

print("Hello, World!")

