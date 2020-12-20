//
//  SecondViewController.swift
//  ColorView
//
//  Created by Igor Denisiuk on 12/18/20.
//

import UIKit

protocol SecondViewControllerDelegate {
    func fillTheViewWithColor(info: UIColor)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: SecondViewControllerDelegate?
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redNumbers: UILabel!
    @IBOutlet var greenNumbers: UILabel!
    @IBOutlet var blueNumbers: UILabel!
    
    @IBOutlet var sliderR: UISlider! {
        didSet {
            sliderR.value = 0
        }
    }
        
   @IBOutlet var sliderG: UISlider! {
        didSet {
            sliderG.value = 0
        }
    }
    
        @IBOutlet var sliderB: UISlider! {
        didSet {
            sliderB.value = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = .black
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.hidesBackButton = true
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
    }
    
   
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        let numberChange = Int(sender.value)
        redNumbers.text = "\(numberChange)"
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        let numberChange = Int(sender.value)
        greenNumbers.text = "\(numberChange)"
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        let numberChange = Int(sender.value)
        blueNumbers.text = "\(numberChange)"
    }
    
    @IBAction func colorChange(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderR.value) / 255, green: CGFloat(sliderG.value) / 255, blue: CGFloat(sliderB.value) / 255, alpha: 1.0)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sendColor(_ sender: UIButton) {
        let info = colorView.backgroundColor
        delegate?.fillTheViewWithColor(info: info!)
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        redNumbers.text = redTF.text
        greenNumbers.text = greenTF.text
        blueNumbers.text = blueTF.text
        
        sliderR.value = Float(redTF.text!) ?? 0
        sliderG.value = Float(greenTF.text!) ?? 0
        sliderB.value = Float(blueTF.text!) ?? 0
        
        colorChange(sliderR)
        colorChange(sliderG)
        colorChange(sliderB)
    }
}
