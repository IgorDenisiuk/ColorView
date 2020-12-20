//
//  ViewController.swift
//  ColorView
//
//  Created by Igor Denisiuk on 12/18/20.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    func fillTheViewWithColor(info: UIColor) {
        mainView.backgroundColor = info
    }

    @IBOutlet var mainView: UIView!
    
    @IBAction func goToSecondVC(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "colorSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.delegate = self
        }
    }
    
}

