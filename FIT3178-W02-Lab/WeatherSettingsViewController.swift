//
//  ViewController.swift
//  FIT3178-W02-Lab
//
//  Created by Saauren Mankad on 10/3/2022.
//

import UIKit

class WeatherSettingsViewController: UIViewController, UITextFieldDelegate, ColourChangeDelegate {
    
    func changedToColour(_ colour: UIColor) {
        
        colourPreviewView.backgroundColor = colour
        
    }
    

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var iconSegmentedControl: UISegmentedControl!
    @IBOutlet weak var colourSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var colourPreviewView: UIView!
        
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showSummarySegue" && descriptionTextField.text?.isEmpty == true {
            displayMessage(title: "Error", message: "A description must be provided")
            return false
        }
        
        return true
    }
    
    
    
    @IBAction func colourSegmentValueChanged(_ sender: Any) {
        
        
        var colourName = colourSegmentedControl.titleForSegment(at: colourSegmentedControl.selectedSegmentIndex) ?? ""
        
        if colourName != "Custom" {
        
            colourName = colourName.appending("Colour")
            
            colourPreviewView.backgroundColor = UIColor(named: colourName)
    
        }
        
        else {
            performSegue(withIdentifier: "pickColourSegue", sender: sender)
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "showSummarySegue" {
            

            let description = descriptionTextField.text ?? ""
            var icon: WeatherIcon = .sun
            
           switch iconSegmentedControl.selectedSegmentIndex {
                case 1:
                    icon = .clouds
                case 2:
                    icon = .rain
                case 3:
                    icon = .lightning
                case 4:
                    icon = .snow
                default:
                    icon = .sun
           }
            let colour = colourPreviewView.backgroundColor?.cgColor
            
            let weatherDetails = WeatherDetails(description: description, backgroundColour: colour, icon: icon)
            
            let destination = segue.destination as! WeatherSummaryViewController
            
            destination.weatherDetails = weatherDetails
        }
        
        else if segue.identifier == "pickColourSegue" {
            
            let destination = segue.destination as! ChooseColourViewController
            destination.initialColour = colourPreviewView.backgroundColor?.cgColor
            destination.delegate = self
            
        }
        
    
    }
    
    func displayMessage(title: String, message: String){
        // displays a message to the user
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default,handler: nil ))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionTextField.delegate = self
        
        var colourName = colourSegmentedControl.titleForSegment(at: colourSegmentedControl.selectedSegmentIndex) ?? ""
        colourName = colourName.appending("Colour")
        colourPreviewView.backgroundColor = UIColor(named: colourName)
    
        
        
    }


    
    
}

