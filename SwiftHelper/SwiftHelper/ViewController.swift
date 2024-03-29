//
//  ViewController.swift
//  SwiftHelper
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.config {
            BC.title("DSL", .normal)
            BC.title("DSL highlighted", .highlighted)
            BC.color(.red, .normal)
            BC.color(.yellow, .highlighted)
        }
      
    }
    
    @IBAction private func actionActionSheet() {
        let alertController = ActionSheet(title: "", message: nil) {
            Action.default("Share") {  }
            Action.default("Download") { }
            Action.cancel("Cancel") {  }
        }
        present(alertController, animated: true, completion: nil)
    }
}

