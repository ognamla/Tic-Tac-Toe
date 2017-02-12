//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ognam.Chen on 2017/2/5.
//  Copyright © 2017年 SwiftCourse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    // play again 且讓所有ox值消失
    @IBAction func playAgainButton(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
            
        }
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500 , y: playAgainButton.center.y)
        
    }
 
    // 1 is nought, 2 is cross
    var activeGame = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // zero is empty, 1 is nought, 2 is cross
    let winingCombination = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2 ,5 ,8],
        [2, 4, 6],
        [0, 4, 8]]
    
    @IBAction func buttonPressed(_ sender: Any) { //setImage(UIImage
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            
            
            if activePlayer == 1 {
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: .normal)
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winingCombination {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Noughts has won!"
                    } else {
                        winnerLabel.text = "Cross has won!"
                    }
                    UIView.animate(withDuration: 0.2, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                    
                }
                
            }
        }
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

