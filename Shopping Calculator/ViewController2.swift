//
//  ViewController2.swift
//  Shopping Calculator
//
//  Created by Julia Li on 6/20/18.
//  Copyright © 2018 Julia Li. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var totalMoneySpent: UILabel!
    @IBOutlet weak var totalMoneySaved: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMoneySpent.text = "$\(String(format: "%.2f", mySpending))"
        totalMoneySaved.text = "$\(String(format: "%.2f", mySavings))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onClickReset(_ sender: UIButton) {
        mySpending = 0
        mySavings = 0
        totalMoneySpent.text = "$"
        totalMoneySaved.text = "$"
    }

}
