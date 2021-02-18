//
//  ExtensionTextField.swift
//  Test
//
//  Created by Viktor Golubenkov on 13.02.2021.
//

import UIKit

extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
    
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        datePicker.minimumDate = midnightToday

        
        //for iOS 14:
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
          datePicker.sizeToFit()
        }
        self.inputView = datePicker
        
       
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

//MARK: - Text Field Delegate

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        locationButtonOutlet.isHidden = false
        toTextFieldOutlet.layer.borderWidth = 0.0
        fromTextFieldOutlet.layer.borderWidth = 0.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fromTextFieldOutlet.endEditing(true)
        toTextFieldOutlet.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if fromTextFieldOutlet.text != "" {
            return true
        } else {
            fromTextFieldOutlet.placeholder = "From"
            return false
        }
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        if let city = searchTextField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
//
//        searchTextField.text = ""
        locationButtonOutlet.isHidden = true
    }
    
}




