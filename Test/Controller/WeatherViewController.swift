//
//  WeatherViewController.swift
//  Test
//
//  Created by Viktor Golubenkov on 15.02.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var dateTime1: UILabel!
    @IBOutlet weak var dateTime2: UILabel!
    @IBOutlet weak var dateTime3: UILabel!
    @IBOutlet weak var dateTime4: UILabel!
    @IBOutlet weak var dateTime5: UILabel!
    
    @IBOutlet weak var temp1: UILabel!
    @IBOutlet weak var temp2: UILabel!
    @IBOutlet weak var temp3: UILabel!
    @IBOutlet weak var temp4: UILabel!
    @IBOutlet weak var temp5: UILabel!
    
    
    var fromCityName = String()
    var toCityName = String()
    var weatherManager = OpenWeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        weatherManager.fetchWeather(cityName: fromCityName)
        
        // custom navigation title
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
                                        imageView.heightAnchor.constraint(equalToConstant: 20),
                                        imageView.widthAnchor.constraint(equalToConstant: 20)])
        
        imageView.image = UIImage(named: "ic_plane")

        let customLabelOne = UILabel()
        customLabelOne.text = toCityName
        let customLabelTwo = UILabel()
        customLabelTwo.text = fromCityName
        
        let stack = UIStackView(arrangedSubviews: [customLabelOne, imageView, customLabelTwo])
        stack.spacing = 3
        stack.alignment = .center
        
        navigationItem.titleView = stack
        
        // custom left bar button
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_nav_back"), style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem  = backBarButtonItem

        

    }
    
    
    // left bar button method
    @objc func back(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: OpenWeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: OpenWeatherManager, weather: OpenWeatherModel) {
        DispatchQueue.main.async {
            self.dateTime1.text = weather.dtTxt1
            self.dateTime2.text = weather.dtTxt2
            self.dateTime3.text = weather.dtTxt3
            self.dateTime4.text = weather.dtTxt4
            self.dateTime5.text = weather.dtTxt5
            
            self.temp1.text = String(format: "%.0f", weather.temperature1) + " " + "ᐤC"
            self.temp2.text = String(format: "%.0f", weather.temperature2) + " " + "ᐤC"
            self.temp3.text = String(format: "%.0f", weather.temperature3) + " " + "ᐤC"
            self.temp4.text = String(format: "%.0f", weather.temperature4) + " " + "ᐤC"
            self.temp5.text = String(format: "%.0f", weather.temperature5) + " " + "ᐤC"
            
            if #available(iOS 13.0, *) {
                self.imageView1.image = UIImage(systemName: weather.conditionName1)
                self.imageView2.image = UIImage(systemName: weather.conditionName2)
                self.imageView3.image = UIImage(systemName: weather.conditionName3)
                self.imageView4.image = UIImage(systemName: weather.conditionName4)
                self.imageView5.image = UIImage(systemName: weather.conditionName5)
            } else {
                self.imageView1.image = .none
                self.imageView2.image = .none
                self.imageView3.image = .none
                self.imageView4.image = .none
                self.imageView5.image = .none
            }

            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
    
