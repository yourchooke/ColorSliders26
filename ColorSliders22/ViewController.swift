//
//  ViewController.swift
//  ColorSliders22
//
//  Created by Olga Yurchuk on 07.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coloredView: UIView!
    
    @IBOutlet weak var redSliderPicker: UISlider!
    @IBOutlet weak var greenSliderPicker: UISlider!
    @IBOutlet weak var blueSliderPicker: UISlider!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 20
        
        redSliderPicker.value = 1
        greenSliderPicker.value = 1
        blueSliderPicker.value = 1
        
        redColorValueLabel.text = String(redSliderPicker.value)
        greenColorValueLabel.text = String(greenSliderPicker.value)
        blueColorValueLabel.text = String(blueSliderPicker.value)
        
    }

    @IBAction func redSliderMove() {
        
        redColorValueLabel.text = String(format: "%.2f", redSliderPicker.value)
        
        changeColor()
        
    }
    
    @IBAction func greenSliderMove() {
        greenColorValueLabel.text = String(format: "%.2f", greenSliderPicker.value)

        changeColor()
        
    }
    
    @IBAction func blueSliderMove() {
        blueColorValueLabel.text = String(format: "%.2f", blueSliderPicker.value)
        
        changeColor()
    }
    
    private func changeColor() {
        let redValue = CGFloat(redSliderPicker.value)
        let greenValue = CGFloat(greenSliderPicker.value)
        let blueValue = CGFloat(blueSliderPicker.value)
        
        coloredView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    
}

