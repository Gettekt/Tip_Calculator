//
//  SettingsViewController.swift
//  tip_calculator
//
//  Created by Honors on 12/13/18.
//  Copyright © 2018 ChristopherStudios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var p1Field: UITextField!
    @IBOutlet weak var p2Field: UITextField!
    @IBOutlet weak var p3Field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        let p1val = defaults.double(forKey: "P1")
        p1Field.text = String(p1val)
        let p2val = defaults.double(forKey: "P2")
        p2Field.text = String(p2val)
        let p3val = defaults.double(forKey: "P3")
        p3Field.text = String(p3val)
    }
    
    @IBAction func setDefaultP1(_ sender: Any) {
        let newp1 = Double(p1Field.text!) ?? 18
        defaults.set(newp1, forKey: "P1")
        defaults.synchronize()
    }
    
    @IBAction func setDefaultP2(_ sender: Any) {
        let newp2 = Double(p2Field.text!) ?? 20
        defaults.set(newp2, forKey: "P2")
        defaults.synchronize()
    }
   
    @IBAction func setDefaultP3(_ sender: Any) {
        let newp3 = Double(p3Field.text!) ?? 25
        defaults.set(newp3, forKey: "P3")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
