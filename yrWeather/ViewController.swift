//
//  ViewController.swift
//  yrWeather
//
//  Created by Joerg Neugebauer on 19.05.19.
//  Copyright © 2019 Joerg Neugebauer. All rights reserved.
//

import UIKit

/*
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
*/



class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var toolBar: UIView!
    @IBOutlet weak var lblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.layer.cornerRadius = 10
        navigationBar.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        
        toolBar.layer.cornerRadius = 10
        toolBar.layer.borderWidth = 1
        toolBar.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        toolBar.layer.backgroundColor = UIColor.clear.cgColor
        
        lblCity.text = "Munich"
        
    }


}

