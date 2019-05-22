//
//  SettingsViewController.swift
//  yrWeather
//
//  Created by Joerg Neugebauer on 20.05.19.
//  Copyright © 2019 Joerg Neugebauer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var lblApplicationInfo: UILabel!
    @IBOutlet weak var lblCopyrightInfo: UILabel!
    @IBOutlet weak var lblCredits: UIView!
    
    let clRed:CGColor = UIColor(red: 238.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let clBlue:CGColor = UIColor(red: 0/255.0, green: 153.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let clOrange:CGColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
    let clGray:CGColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 0.8).cgColor
    
    
    @IBAction func buttonCloseClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonClose.layer.backgroundColor = clBlue
        buttonClose.layer.cornerRadius = 10
        
        lblCopyrightInfo.text = "©2019 jn18dev"
        
        lblCredits.layer.cornerRadius = 10
        lblCredits.layer.backgroundColor = clGray

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
