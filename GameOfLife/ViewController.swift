//
//  ViewController.swift
//  GameOfLife
//
//  Created by Itamar Levy-Or on 10/15/14.
//  Copyright (c) 2014 Itamar Levy-Or. All rights reserved.
//

import UIKit

let gg = [
    (5, 1),
    (6, 1),
    (5, 2),
    (6, 2),
    (5, 11),
    (6, 11),
    (7, 11),
    (4, 12),
    (8, 12),
    (3, 13),
    (9, 13),
    (3, 14),
    (9, 14),
    (6, 15),
    (4, 16),
    (8, 16),
    (5, 17),
    (6, 17),
    (7, 17),
    (6, 18),
    (3, 21),
    (4, 21),
    (5, 21),
    (3, 22),
    (4, 22),
    (5, 22),
    (2, 23),
    (6, 23),
    (1, 25),
    (2, 25),
    (6, 25),
    (7, 25),
    (3, 35),
    (4, 35),
    (3, 36),
    (4, 36)
]

class ViewController: UIViewController {
    

    @IBOutlet weak var colonyView: ColonyView!
        var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func evolveTimes(Sender: UIButton){
        colonyView.colony.evolveTimes(Sender.tag)
        colonyView.setNeedsDisplay()
    }
    @IBAction func speedSliderChanged(sender: UISlider) {
        if let t = timer {
            t.invalidate()
        }
        if(sender.value != 0){
            timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0 - sender.value), target: self, selector: "doTimer", userInfo: nil, repeats: true)
            
        }
    }
    func doTimer(){
        colonyView.colony.evolve()
        colonyView.setNeedsDisplay()
    }
    @IBAction func basicColony(sender: UIButton) {
        colonyView.colony.resetColony()
        colonyView.colony.setCell(1, row: 10, col: 10)
        colonyView.colony.setCell(1, row: 11, col: 10)
        colonyView.colony.setCell(1, row: 9, col: 10)
        colonyView.colony.setCell(1, row: 10, col: 9)
        colonyView.setNeedsDisplay()
    }
    @IBAction func gun(sender: UIButton) {
        colonyView.colony.resetColony()
        for (row, col) in gg {
            colonyView.colony.setCell(1, row: row, col: col)
        }
        colonyView.setNeedsDisplay()
    }
    @IBAction func random(sender: UIButton){
colonyView.colony.resetColony()
        for a in 0..<200 {
            
            var row = Int(arc4random_uniform(UInt32(40)))
            var col = Int(arc4random_uniform(UInt32(40)))
            colonyView.colony.setCell(1, row: row, col: col)
        }
        colonyView.setNeedsDisplay()
    }
}

