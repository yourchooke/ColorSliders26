//
//  ColoredViewController.swift
//  ColorSliders26
//
//  Created by Olga Yurchuk on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(for color: UIColor)
}

class ColoredViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.color = self.view.backgroundColor
        settingsVC.delegate = self
        print("!")
    }

}

extension ColoredViewController: SettingsViewControllerDelegate {
    func setNewColor(for color: UIColor) {
        self.view.backgroundColor = color
    }
}
