//
//  ViewController.swift
//  PreWork
//
//  Created by Bender on 11/23/23.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


class ViewController: UIViewController {

    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#33658A")
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func stepperDidChange(_ sender: UIStepper )
    {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // Declare the introduction variable here
        var introduction = ""

        if let firstName = firstNameTextField.text,
           let lastName = lastNameTextField.text,
           let schoolName = schoolNameTextField.text,
           let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex),
           let numberOfPets = numberOfPetsLabel.text {
           
           introduction = "My name is \(firstName) \(lastName) and I attend \(schoolName). I am currently in my \(year) year and I own \(numberOfPets) cats. It is \(morePetsSwitch.isOn) that I want more pets."
           
           print(introduction)
        } else {
           // Handle the case where one or more of the values are nil
           print("One or more values are missing.")
        }

        // Creates the alert where we pass in our message, which is our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you CodePath!", style: .default, handler: nil)

        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }




}

