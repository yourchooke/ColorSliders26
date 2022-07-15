//
//  ColoredViewController.swift
//  ColorSliders26
//
//  Created by Olga Yurchuk on 13.07.2022.
//

import UIKit

class ColoredViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.color = self.view.backgroundColor
        print("!")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        print("unwind")
        self.view.backgroundColor = settingsVC.color
    }

}
