//
//  ViewController.swift
//  ParkItBoi
//
//  Created by Cavan Cook on 12/2/19.
//  Copyright © 2019 Cavan Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonChoice:String = "Cars"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func MotoSegue(_ sender: UIButton) {
        buttonChoice = "Motorcycles"
    }
    
    @IBAction func BikeSegue(_ sender: UIButton) {
        buttonChoice = "Bikes"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mapVC = segue.destination as? MapViewController else {return}
        mapVC.choice = buttonChoice
    }

}

