//
//  ViewController.swift
//  Meters Converter
//
//  Created by Anastasio Del Toro Almansa on 07/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let mile = 1.60934
    //let kiloMeter = 0.1069
    
    

    @IBOutlet var distanceTextField: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Listos para empezar
        distanceTextField.delegate = self
        self.hideKeyboardWhentapping()
        
        
    }
    
    
    @IBAction func buttonConvert(_ sender: Any) {
        
        let unitSystem = segmentedControl.selectedSegmentIndex
        
        if let textField = Double(distanceTextField.text!)
        {
            //0 = meters; 1 = miles
            if unitSystem == 1 {
                //lets convert to meters
                let convertedValue = textField * mile
                labelResult.text = String(format:"%.2f",convertedValue) + " Km"
                
            } else {
                //lets convert to miles
                let convertedValue = textField / mile
                labelResult.text = String(format:"%.2f",convertedValue) + " mi"
            }
        }// if let - unwrap optional to into a Double
        
        dismissKeyboard()
    }
    
}

/***********DELEGATES & EXTENSIONS***********/

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhentapping () {
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
       
        view.addGestureRecognizer(tap)
        
    }
    
}
