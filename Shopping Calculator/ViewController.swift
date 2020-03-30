//
//  ViewController.swift
//  Shopping Calculator
//
//  Created by Julia Li on 6/19/18.
//  Copyright © 2018 Julia Li. All rights reserved.
//

import UIKit

var mySpending: Double = 0
var mySavings: Double = 0

class ViewController: UIViewController {

    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var origPrice: UITextField!
    @IBOutlet weak var discountPercent: UITextField!
    @IBOutlet weak var salesTaxPercent: UITextField!
    var discountPercentToDecimal: Double = 1
    var salesTaxPercentToDecimal: Double = 1
    var origPriceToDouble2: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func origPriceChanged(_ sender: UITextField) {
        if let origPriceToDouble = Double(origPrice.text!) {
            origPriceToDouble2 = origPriceToDouble
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else if (origPrice.text == "") {
            origPriceToDouble2 = 0
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else {
        finalPrice.text = "Please Enter the Original Price"
        }
        
    }
    
    @IBAction func discountChanged(_ sender: UITextField) {
        if let discountPercentToDouble = Double(discountPercent.text!) {
            discountPercentToDecimal = 1-(discountPercentToDouble*0.01)
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else if (discountPercent.text == "") {
            discountPercentToDecimal = 1
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else {
            finalPrice.text = "Please Enter Numerical Values"
        }
    }
    
    
    @IBAction func salesTaxChanged(_ sender: UITextField) {
        if let salesTaxPercentToDouble = Double(salesTaxPercent.text!) {
            salesTaxPercentToDecimal = 1+(salesTaxPercentToDouble*0.01)
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else if (salesTaxPercent.text == "") {
            salesTaxPercentToDecimal = 1
            finalPrice.text = "$\(String(format: "%.2f", origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal))"
        }
        else {
            finalPrice.text = "Please Enter Numerical Values"
        }
    }
    
    
    @IBAction func onButtonClick(_ sender: UIButton) {
        if ((salesTaxPercent.text == "" && Double(discountPercent.text!) != nil) || (discountPercent.text == "" && Double(salesTaxPercent.text!) != nil)) {
            mySpending += (origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal)
            mySavings += origPriceToDouble2-(origPriceToDouble2*discountPercentToDecimal)
        }
        else if((Double(salesTaxPercent.text!) != nil) && (Double(discountPercent.text!) != nil)) {
            mySpending += (origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal)
            mySavings += (origPriceToDouble2-(origPriceToDouble2*discountPercentToDecimal))
        }
        else if (salesTaxPercent.text=="" && discountPercent.text==""){
            mySpending += (origPriceToDouble2*discountPercentToDecimal*salesTaxPercentToDecimal)
            mySavings += origPriceToDouble2-(origPriceToDouble2*discountPercentToDecimal)
        }
        else {
//            https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
            let alert = UIAlertController(title: "Error", message: "Please Only Use Numerical Values", preferredStyle: UIAlertControllerStyle.alert)            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

