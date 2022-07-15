//
//  ViewController.swift
//  ColorSliders22
//
//  Created by Olga Yurchuk on 07.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var coloredView: UIView!
    
    @IBOutlet weak var redSliderPicker: UISlider!
    @IBOutlet weak var greenSliderPicker: UISlider!
    @IBOutlet weak var blueSliderPicker: UISlider!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    var color: UIColor!
    
    
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
        
        redColorValueLabel.text = String(redSliderPicker.value)
        greenColorValueLabel.text = String(greenSliderPicker.value)
        blueColorValueLabel.text = String(blueSliderPicker.value)
    }

    @IBAction func redSliderMove() {
        redColorValueLabel.text = string(slider: redSliderPicker)
        changeColor()
    }
    
    @IBAction func greenSliderMove() {
        greenColorValueLabel.text = string(slider: greenSliderPicker)
        changeColor()
    }
    
    @IBAction func blueSliderMove() {
        blueColorValueLabel.text = string(slider: blueSliderPicker)
        changeColor()
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
    
}

