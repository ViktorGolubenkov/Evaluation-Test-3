//
//  MainViewController.swift
//  Test
//
//  Created by Viktor Golubenkov on 12.02.2021.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    @IBOutlet weak var notificationsButtonOutlet: UIButton!
    
    @IBOutlet weak var fromTextFieldOutlet: UITextField!
    @IBOutlet weak var fromSubtitleLabel: UILabel!
    
    @IBOutlet weak var toTextFieldOutlet: UITextField!
    @IBOutlet weak var toSubtitleLabel: UILabel!
    
    @IBOutlet weak var swapCitiesOutlet: UIButton!
    
    @IBOutlet weak var fromDateTextField: UITextField!
    @IBOutlet weak var toDateTextField: UITextField!
    
    @IBOutlet weak var addAdultOutlet: UIButton!
    @IBOutlet weak var removeAdultOutlet: UIButton!
    @IBOutlet weak var numberOfAdultLabel: UILabel!
    
    @IBOutlet weak var addChildOutlet: UIButton!
    @IBOutlet weak var removeChildOutlet: UIButton!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!

    
    @IBOutlet weak var addInfantOutlet: UIButton!
    @IBOutlet weak var removeInfantOutlet: UIButton!
    @IBOutlet weak var numberOfInfantsLabel: UILabel!
    @IBOutlet weak var infantsDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var childImageOutlet: UIImageView!
    @IBOutlet weak var infantImageOutlet: UIImageView!
    
    @IBOutlet weak var locationButtonOutlet: UIButton!
    
    
    let locationManager = CLLocationManager()
    var cityManager = CityManager()
    let weatherViewController = WeatherViewController()

    
    var adults: Int = 1
    var childs: Int = 0
    var infants: Int = 0
    var passengers: Int = 1
    
    let minAdults: Int = 1
    let minChilds: Int = 0
    let minInfants: Int = 0
    let maxPassengers: Int = 9

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // date picker "From" in text field
        self.fromDateTextField.setInputViewDatePicker(target: self, selector: #selector(dateThere))
        // date picker "To" in text field
        self.toDateTextField.setInputViewDatePicker(target: self, selector: #selector(dateBack))
        
        
        locationButtonOutlet.isHidden = true
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        cityManager.cityDelegate = self
        
        fromTextFieldOutlet.delegate = self
        toTextFieldOutlet.delegate = self
        
        
        // custom colors
        notificationsButtonOutlet.tintColor = #colorLiteral(red: 1, green: 0.4309999943, blue: 0.0390000008, alpha: 1)
        
        swapCitiesOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        
        addAdultOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        removeAdultOutlet.tintColor = #colorLiteral(red: 0.5569999814, green: 0.5569999814, blue: 0.5759999752, alpha: 1)
        
        addChildOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        removeChildOutlet.tintColor = #colorLiteral(red: 0.5569999814, green: 0.5569999814, blue: 0.5759999752, alpha: 1)
        addInfantOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        locationButtonOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        
        removeInfantOutlet.tintColor = #colorLiteral(red: 0.5139999986, green: 0.5649999976, blue: 0.6430000067, alpha: 1)
        infantImageOutlet.tintColor = #colorLiteral(red: 0.5139999986, green: 0.5649999976, blue: 0.6430000067, alpha: 1)
        childImageOutlet.tintColor = #colorLiteral(red: 0.5139999986, green: 0.5649999976, blue: 0.6430000067, alpha: 1)
        numberOfInfantsLabel.tintColor = #colorLiteral(red: 0.5139999986, green: 0.5649999976, blue: 0.6430000067, alpha: 1)
        
        numberOfAdultLabel.text = "1"
        
        
    }

    
    
    // notification bell
    @IBAction func notificationsButtonPressed(_ sender: UIButton) {
        notificationsButtonOutlet.setImage(UIImage?(#imageLiteral(resourceName: "ic_notiffications")), for: .normal)
        notificationsButtonOutlet.tintColor = #colorLiteral(red: 0.5019999743, green: 0.5649999976, blue: 0.6510000229, alpha: 1)
 
    }
    

    
    
    // for swaping cities
    @IBAction func swapCitiesButtonPressed(_ sender: UIButton) {
        
        if fromTextFieldOutlet != nil && toTextFieldOutlet != nil {
            let fromCity = fromTextFieldOutlet.text
            let toCity = toTextFieldOutlet.text
            fromTextFieldOutlet.text = toCity
            toTextFieldOutlet.text = fromCity
        }

    }
    
    //MARK: - Adults
    @IBAction func addAdult(_ sender: UIButton) {
        if adults >= 1 && adults < maxPassengers && passengers != 9 {
            adults += 1
            passengers += 1
            numberOfAdultLabel.text = String(adults)
            removeAdultOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
        }
    }
    
    @IBAction func removeAdult(_ sender: UIButton) {
        if adults != 1 && adults == infants {
            adults -= 1
            infants -= 1
            passengers -= 2
            numberOfAdultLabel.text = String(adults)
            numberOfInfantsLabel.text = String(infants)
        } else if adults != 1 {
            adults -= 1
            passengers -= 1
            numberOfAdultLabel.text = String(adults)
        }
    }
    //MARK: - Childs
    @IBAction func addChild(_ sender: UIButton) {
        if childs < passengers && passengers != 9 {
            childs += 1
            passengers += 1
            removeChildOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
            numberOfChildrenLabel.textColor = #colorLiteral(red: 0.06700000167, green: 0.09399999678, blue: 0.125, alpha: 1)
            childImageOutlet.tintColor = #colorLiteral(red: 0.06700000167, green: 0.09399999678, blue: 0.125, alpha: 1)
            numberOfChildrenLabel.text = String(childs)
        }
    }
    
    @IBAction func removeChild(_ sender: UIButton) {
        if childs != 0 {
            childs -= 1
            passengers -= 1
            numberOfChildrenLabel.text = String(childs)
        }
    }
    //MARK: - Infants
    @IBAction func addInfant(_ sender: UIButton) {
        if infants < adults && passengers != 9 {
            infants += 1
            passengers += 1
            removeInfantOutlet.tintColor = #colorLiteral(red: 0, green: 0.2080000043, blue: 0.5799999833, alpha: 1)
            numberOfInfantsLabel.textColor = #colorLiteral(red: 0.06700000167, green: 0.09399999678, blue: 0.125, alpha: 1)
            infantsDescriptionLabel.textColor = #colorLiteral(red: 0.06700000167, green: 0.09399999678, blue: 0.125, alpha: 1)
            infantImageOutlet.tintColor = #colorLiteral(red: 0.06700000167, green: 0.09399999678, blue: 0.125, alpha: 1)
            numberOfInfantsLabel.text = String(infants)
        }
    }
    
    @IBAction func removeInfant(_ sender: UIButton) {
        if infants != 0 {
            infants -= 1
            passengers -= 1
            numberOfInfantsLabel.text = String(infants)
        }
    }
    
    //MARK: - "Continue" Button 

    @IBAction func continueButtonPressed(_ sender: UIButton) {

        if toTextFieldOutlet.text!.isEmpty == true && fromTextFieldOutlet.text!.isEmpty == true {
            toTextFieldOutlet.layer.borderWidth = 2
            toTextFieldOutlet.layer.cornerRadius = 8
            fromTextFieldOutlet.layer.borderWidth = 2
            fromTextFieldOutlet.layer.cornerRadius = 8
        } else if toTextFieldOutlet.text!.isEmpty == true {
            toTextFieldOutlet.layer.borderWidth = 2
            toTextFieldOutlet.layer.cornerRadius = 8
        } else if fromTextFieldOutlet.text!.isEmpty == true {
            fromTextFieldOutlet.layer.borderWidth = 2
            fromTextFieldOutlet.layer.cornerRadius = 8
        } else {
            performSegue(withIdentifier: "ContinueSegue", sender: self)
        }
        
    }
    
    //MARK: - Navigation to "Weather"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.destination is WeatherViewController {
            let weatherViewController = segue.destination as? WeatherViewController
            weatherViewController?.fromCityName = toTextFieldOutlet.text!
            weatherViewController?.toCityName = fromTextFieldOutlet.text!
        }
    }


}

//MARK: - LocationManager

extension MainViewController: CLLocationManagerDelegate {
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            cityManager.fetchCityThroughWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

//MARK: - CityManagerDelegate

extension MainViewController: CityManagerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    func didUpdateCity(_ cityManager: CityManager, city: CityModel) {
        DispatchQueue.main.async {
            self.fromTextFieldOutlet.text = city.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}






