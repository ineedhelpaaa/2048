//
//  ViewController.swift
//  2048 game
//
//  Created by Student on 8/1/18.
//  Copyright © 2018 Mindframe-Student-3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var board = [[0, 0, 0, 0],
                 [0, 0, 0, 0],
                 [0, 0, 0, 0],
                 [0, 0, 0, 0]]
    
    func printBoard() {
        var buffer: String = ""
        for row in 0 ... 3 {
            for col in 0 ... 3 {
                buffer += String(board[row][col]) + " "
            }
            if row < 3 {
                buffer += "\n"
            }
        }
        label.text = buffer
        print(buffer)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addToBoard() {
        var empty = 0
        for k in 0 ... 15 {
            if board[k/4][k%4] == 0 {
                empty += 1
            }
        }
        print(empty)
        let placement = arc4random_uniform(UInt32(empty))
        print(placement)
        
        var count = 0
        for k in 0 ... 15 {
            if board[k/4][k%4] == 0 {
                if UInt32(count) == placement {
                    board[k/4][k%4] = 2
                    break
                }
                count += 1
            }
        }
    }
    @IBAction func moveDown(sender: AnyObject) {
        collapse(direction: 0)
        for col in 0 ... 3 {
            for irow in 0 ... 2 {
                if board[3-irow][col] == board[2-irow][col] {
                    board[3-irow][col] *= 2
                    board[2-irow][col] = 0
                }
            }
        }
        collapse(direction: 0)
        //addToBoard()
        printBoard()
    }
    func collapse(direction: Int) {
        if direction == 0 {
            for col in 0 ... 3 {
                for i in 1 ... 3 {
                    for row in i...3 {
                        if board[row][col] == 0 {
                            board[row][col] = board[row-1][col]
                            board[row-1][col] = 0
                        }
                    }
                }
            }
        }
    }
}
