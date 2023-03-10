//
//  ChooseColourViewController.swift
//  FIT3178-W02-Lab
//
//  Created by Saauren Mankad on 11/3/2022.
//

import UIKit

protocol ColourChangeDelegate: AnyObject {
    func changedToColour(_ colour: UIColor)
}


class ChooseColourViewController: UIViewController {

    @IBOutlet weak var colourView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // delegate property
    weak var delegate: ColourChangeDelegate?

    var initialColour: CGColor?
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let redValue = CGFloat(redSlider.value)
        let blueValue = CGFloat(blueSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        
        let newColour = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        
        colourView.backgroundColor = newColour
        delegate?.changedToColour(newColour)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if initialColour != nil && (initialColour!.numberOfComponents >= 3) {

            let components = initialColour?.components
            let redComponent = components?[0]
            let greenComponent = components?[1]
            let blueComponent = components?[2]

            redSlider.value = Float(redComponent!)
            greenSlider.value = Float(greenComponent!)
            blueSlider.value = Float(blueComponent!)
            
            colourView.backgroundColor = UIColor(red: redComponent!, green: greenComponent!, blue: blueComponent!, alpha: 1.0)
        }
        
        // Do any additional setup after loading the view.
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
