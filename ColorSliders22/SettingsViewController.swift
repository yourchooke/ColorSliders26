//
//  ViewController.swift
//  ColorSliders22
//
//  Created by Olga Yurchuk on 07.06.2022.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var coloredView: UIView!
    
    @IBOutlet weak var redSliderPicker: UISlider!
    @IBOutlet weak var greenSliderPicker: UISlider!
    @IBOutlet weak var blueSliderPicker: UISlider!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        coloredView.backgroundColor = color
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSliderPicker.value = Float(red)
        greenSliderPicker.value = Float(green)
        blueSliderPicker.value = Float(blue)
        
        redColorValueLabel.text = string(slider: redSliderPicker)
        greenColorValueLabel.text = string(slider: greenSliderPicker)
        blueColorValueLabel.text = string(slider: blueSliderPicker)
        
        redTextField.text = string(slider: redSliderPicker)
        greenTextField.text = string(slider: greenSliderPicker)
        blueTextField.text = string(slider: greenSliderPicker)
    }

    @IBAction func doneButtonPressed() {
        delegate.setNewColor(for: coloredView.backgroundColor ?? UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        dismiss(animated: true)
    }
    
    @IBAction func redSliderMove() {
        redColorValueLabel.text = string(slider: redSliderPicker)
        redTextField.text = string(slider: redSliderPicker)
        changeColor()
    }
    
    @IBAction func greenSliderMove() {
        greenColorValueLabel.text = string(slider: greenSliderPicker)
        greenTextField.text = string(slider: greenSliderPicker)
        changeColor()
    }
    
    @IBAction func blueSliderMove() {
        blueColorValueLabel.text = string(slider: blueSliderPicker)
        blueTextField.text = string(slider: blueSliderPicker)
        changeColor()
    }
    
    @IBAction func RGBTextField(_ sender: UITextField){
        switch sender {
        case redTextField:
            changeColor()
            //redSliderPicker.value = Float(redTextField.text)
        case greenTextField: changeColor()
        default:
            changeColor()
        }
    }
    
    private func changeColor() {
        let redValue = CGFloat(redSliderPicker.value)
        let greenValue = CGFloat(greenSliderPicker.value)
        let blueValue = CGFloat(blueSliderPicker.value)
        color = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        coloredView.backgroundColor = color
    }
    
    private func string(slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        switch textField {
        case redTextField:
            changeColor()
        case greenTextField: changeColor()
        default:
            changeColor()
        }
    }
}

