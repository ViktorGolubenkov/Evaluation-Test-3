//
//  ExtensionMainViewController.swift
//  Test
//
//  Created by Viktor Golubenkov on 15.02.2021.
//

import UIKit

extension MainViewController {
    
    //    date picker in text field
        @objc func dateThere() {
            
            let dateformatter = DateFormatter()
            
            if let datePicker = self.fromDateTextField.inputView as? UIDatePicker {
                
                dateformatter.dateStyle = .short
                dateformatter.setLocalizedDateFormatFromTemplate("d MM y")

                self.fromDateTextField.text = dateformatter.string(from: datePicker.date)
            }
            self.fromDateTextField.resignFirstResponder()
        }
        
        @objc func dateBack() {
            let dateformatter = DateFormatter()
            
            if let datePicker = self.toDateTextField.inputView as? UIDatePicker {
                
                dateformatter.dateStyle = .short
                dateformatter.setLocalizedDateFormatFromTemplate("d MM y")

                self.toDateTextField.text = dateformatter.string(from: datePicker.date)
            }
            self.toDateTextField.resignFirstResponder()
            
        }
    
}


