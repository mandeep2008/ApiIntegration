//
//  ViewController.swift
//  ApiIntegration
//
//  Created by Prabh on 22/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userId: UITextField!
    
    @IBOutlet weak var textfieldTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func Button(_ sender: Any) {
        let parms: [String:Any] = ["userId": Int(userId.text ?? "0"), "title": textfieldTitle.text, "body": "this is body"]
        ApiManager.shared.postAPi(parametrs: parms ){ response in
            print(response)
            
        }

    }
       
}

