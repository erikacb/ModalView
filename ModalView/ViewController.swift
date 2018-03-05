//
//  ViewController.swift
//  ModalView
//
//  Created by Erika Bueno on 05/03/18.
//  Copyright © 2018 Erika Bueno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMeSomething(_ sender: Any) {
        self.view.addSubview(ModalView.init(nib: "TestNib", showDismiss: false))
    }
    
}

