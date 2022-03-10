//
//  WeatherSummaryViewController.swift
//  FIT3178-W02-Lab
//
//  Created by Saauren Mankad on 10/3/2022.
//

import UIKit

class WeatherSummaryViewController: UIViewController {
    
    var weatherDetails: WeatherDetails?
    
    @IBOutlet weak var summaryButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let weatherDetails = weatherDetails else {
            return
        }
        
        summaryButton.setTitle(weatherDetails.description, for: .normal)
        
        //let buttonImage = UIImage(systemName: weatherDetails
        
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
