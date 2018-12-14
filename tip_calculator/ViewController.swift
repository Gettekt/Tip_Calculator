//
//  ViewController.swift
//  tip_calculator
//
//  Created by Honors on 12/13/18.
//  Copyright © 2018 ChristopherStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var s1Button: UIButton!
    @IBOutlet weak var s2Button: UIButton!
    @IBOutlet weak var s3Button: UIButton!
    @IBOutlet weak var s4Button: UIButton!
    @IBOutlet weak var s5Button: UIButton!
    @IBOutlet weak var s6Button: UIButton!
    @IBOutlet weak var s7Button: UIButton!
    @IBOutlet weak var s8Button: UIButton!
    @IBOutlet weak var s9Button: UIButton!
    @IBOutlet weak var s10Button: UIButton!
    
    lazy var button_ar = [s1Button,s2Button,s3Button,s4Button,s5Button,
                          s6Button,s7Button,s8Button,s9Button,s10Button]
    var buttons = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0]
    var active_button_index = 0
    
    
    let defaults = UserDefaults.standard
    var tipPercentages = [0.18, 0.2, 0.25]
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        if defaults.double(forKey:"P1") == 0{
            defaults.set("18", forKey:"P1")
        }
        if defaults.double(forKey:"P2") == 0{
            defaults.set("20", forKey:"P2")
        }
        if defaults.double(forKey:"P3") == 0{
            defaults.set("25", forKey:"P3")
        }
        active_button_index = 0
        billField.text = defaults.string(forKey:"lastbill") ?? "0"
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        let p1 = defaults.double(forKey:"P1")
        tipPercentages[0] = p1/100
        tipControl.setTitle(String(p1) + "%", forSegmentAt:0)
        let p2 = defaults.double(forKey:"P2")
        tipPercentages[1] = p2/100
        tipControl.setTitle(String(p2) + "%", forSegmentAt:1)
        let p3 = defaults.double(forKey:"P3")
        tipPercentages[2] = p3/100
        tipControl.setTitle(String(p3) + "%", forSegmentAt:2)
        calcTip(tipControl)
    }

    @IBAction func swapButtons(_ sender: UIButton) {
        if sender.titleLabel?.text == "1"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 0
            s1Button.backgroundColor = UIColor.gray
            calcTip(s1Button)
        }
        if sender.titleLabel?.text == "2"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 1
            s2Button.backgroundColor = UIColor.gray
            calcTip(s2Button)
        }
        if sender.titleLabel?.text == "3"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 2
            s3Button.backgroundColor = UIColor.gray
            calcTip(s3Button)
        }
        if sender.titleLabel?.text == "4"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 3
            s4Button.backgroundColor = UIColor.gray
            calcTip(s4Button)
        }
        if sender.titleLabel?.text == "5"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 4
            s5Button.backgroundColor = UIColor.gray
            calcTip(s5Button)
        }
        if sender.titleLabel?.text == "6"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 5
            s6Button.backgroundColor = UIColor.gray
            calcTip(s6Button)
        }
        if sender.titleLabel?.text == "7"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 6
            s7Button.backgroundColor = UIColor.gray
            calcTip(s7Button)
        }
        if sender.titleLabel?.text == "8"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 7
            s8Button.backgroundColor = UIColor.gray
            calcTip(s8Button)
        }
        if sender.titleLabel?.text == "9"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 8
            s9Button.backgroundColor = UIColor.gray
            calcTip(s9Button)
        }
        if sender.titleLabel?.text == "10"{
            button_ar[active_button_index]!.backgroundColor = UIColor.white
            active_button_index = 9
            s10Button.backgroundColor = UIColor.gray
            calcTip(s10Button)
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)
        let share  = total/buttons[active_button_index]
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        shareLabel.text = String(format: "$%.2f",share)
        defaults.set(bill, forKey: "lastbill")
        
    }
}

