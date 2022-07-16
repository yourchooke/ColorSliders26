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
        blueTextField.text = string(slider: blueSliderPicker)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
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
        color = UIColor(
            red: CGFloat(redSliderPicker.value),
            green: CGFloat(greenSliderPicker.value),
            blue: CGFloat(blueSliderPicker.value),
            alpha: 1
        )
        coloredView.backgroundColor = color
    }
    
    private func string(slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        switch textField {
        case redTextField:
            redSliderPicker.value = Float(redTextField.text!) ?? 0.0
            redColorValueLabel.text = String(redTextField.text!)
            changeColor()
        case greenTextField:
            greenSliderPicker.value = Float(greenTextField.text!) ?? 0.0
            greenColorValueLabel.text = String(greenTextField.text!)
            changeColor()
        default:
            blueSliderPicker.value = Float(blueTextField.text!) ?? 0.0
            blueColorValueLabel.text = String(blueTextField.text!)
            changeColor()
        }
    }
    
    // то, что ниже, я цинично списала, потому что стало жалко трудов, потраченных на всё остальное по textfield
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

