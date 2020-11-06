//
//  ViewController.swift
//  Calculator
//
//  Created by Jasoneli on 20/10/2020.
//  Copyright © 2020 Jasoneli. All rights reserved.
//

import UIKit

enum ArithmaticOperation {
    case Add
    case Subtract
    case Multiply
    case Divide
    case Resolve
    
}
class ViewController: UIViewController {
    var userInput: String = ""
    
      var firstNumber: Double = 0
    
    var arithmaticOperator: ArithmaticOperation = .Resolve
    @IBOutlet var userIputlabel: UILabel!
    
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divdeButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var zero: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showUserInput()
        
    }
    
    
    
    
    
    func showUserInput(){
        //if there is no user input show 0 instead
        if self.userInput == ""{
            self.userIputlabel.text = "0"
        } else {
            self.userIputlabel.text = " \(self.userInput)"
        
    }
    }
    func addUserInput(input: String )  {
        if self.userInput.count == 9 {
            return}
        
        if self.userInput.contains(".") && input == "." {
            return
        }
        
        self.userInput.append(input)
        self.showUserInput()
    }
    //Number buttons
    @IBAction func zeroButtonTapped() {
        self.addUserInput(input: "0")
        
    }
    @IBAction func oneButtonTapped() {
          self.addUserInput(input: "1")
    }
    @IBAction func twoButtonTapped() {
          self.addUserInput(input: "2")    }
    
    @IBAction func threeButtonTapped() {
         self.addUserInput(input: "3")
    }
    
    @IBAction func fourButtonTapped() {
          self.addUserInput(input: "4")
        
    }
    
    @IBAction func fiveButtonTapped() {
        
          self.addUserInput(input: "5")
    }
    
    @IBAction func sixButtonTapped() {
        
          self.addUserInput(input: "6")
    }
    
    @IBAction func sevenButtonTapped() {
        
          self.addUserInput(input: "7")
    }
    
    @IBAction func eightButtonTapped() {
        
          self.addUserInput(input: "8")
    }
    
    @IBAction func nineButtonTapped() {
        
          self.addUserInput(input: "9")
    }
    
    //Arithmatic buttons
    @IBAction func addButtonTapped() {
        self.performOperator(arithmaticOperator: .Add)
    }
    
    @IBAction func subractButtonTapped() {
         self.performOperator(arithmaticOperator: .Subtract)
        
    }
    
    @IBAction func multiplyButtonTapped() {
        self.performOperator(arithmaticOperator: .Multiply)
        
    }
    
    @IBAction func divideButtonTapped() {
         self.performOperator(arithmaticOperator: .Divide)
        
    }
    
    
    @IBAction func equalsButtonTapped() {
         self.performOperator(arithmaticOperator: .Resolve)
        
    }
    
    @IBAction func percentButtonTapped() {
        if let second = Double(self.userInput), self.firstNumber != 0 {
            let newNumber = self.firstNumber * second / 100
            self.userInput = "\(newNumber)"
            self.performOperator(arithmaticOperator: .Resolve)
        }
        else if let input = Double(self.userInput) {
            let newNumber = input / 100
            self.firstNumber = newNumber
            self.userInput = ""
            self.userIputlabel.text = "\(newNumber)"
            
        
        }
        
    }
    
    @IBAction func plusMinusButtonTapped() {
        if let second = Double(self.userInput) {
            self.userInput = "\(second * -1)"
            self.userIputlabel.text = self.userInput
        }
        else {
            self.firstNumber = self.firstNumber * -1
            self.userIputlabel.text = "\(self.firstNumber)"
        }
    }
    
    @IBAction func decimalButtonTapped() {}
    
   @IBAction func clearButtonTapped() {
    if self.userInput.count > 0 {
        self.userInput = ""
        self.showUserInput()
    }
    else {
        self.firstNumber = 0
        self.arithmaticOperator = .Resolve
        self.userInput = ""
        self.showUserInput()
    }
}
    
    
    // 5 + 5 + 6 = + 2
    // 5 + 1 = = =
        func performOperator(arithmaticOperator: ArithmaticOperation) {
            if let userNumber = Double(self.userInput) {
                let newNumber = self.doMath(first: self.firstNumber, second: userNumber, arithmatic: self.arithmaticOperator)
                self.firstNumber = newNumber
                self.userInput = ""
                self.userIputlabel.text = "\(newNumber)"
                self.arithmaticOperator = arithmaticOperator
            } else{
                self.arithmaticOperator = arithmaticOperator
            }
}

    func doMath(first: Double, second: Double, arithmatic: ArithmaticOperation) -> Double {
        switch arithmatic {
        case .Add:
            return first + second
        case .Subtract:
            return first - second
        case .Multiply:
            return first * second
        case .Divide:
            if second == 0{
                return first
            }
            return first / second
        case .Resolve:
            return second
        }
}
//swipe to delete
    @IBAction func didSwipe(){
        if self.userInput.count > 0{
            self.userInput.removeLast()
            self.showUserInput()
        }
    }
}
