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
    @IBOutlet weak var buttonMonday: UIButton!
    @IBOutlet weak var buttonTuesday: UIButton!
    @IBOutlet weak var buttonWednesday: UIButton!
    @IBOutlet weak var buttonThursday: UIButton!
    @IBOutlet weak var buttonFriday: UIButton!
    @IBOutlet weak var buttonSaturday: UIButton!
    @IBOutlet weak var buttonSunday: UIButton!
    
    let MON:Int = 1
    let TUE:Int = 2
    let WED:Int = 3
    let THU:Int = 4
    let FRI:Int = 5
    let SAT:Int = 6
    let SUN:Int = 7
    
    let clBlue:CGColor = UIColor(red: 0/255.0, green: 153.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let clOrange:CGColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
    
    @IBAction func weekdayClicked(_ sender: UIButton) {
        print( "clicked button \(sender.tag)" )
        
        resetWeekday(but: buttonMonday)
        resetWeekday(but: buttonTuesday)
        resetWeekday(but: buttonWednesday)
        resetWeekday(but: buttonThursday)
        resetWeekday(but: buttonFriday)
        resetWeekday(but: buttonSaturday)
        resetWeekday(but: buttonSunday)
        
        highlightWeekday(but: sender)
    }
    

    func resetWeekday( but: UIButton) {
        but.layer.backgroundColor = UIColor.clear.cgColor
        print( "reset button \(but.tag)" )
    }
    
    func highlightWeekday( but: UIButton) {
        but.layer.backgroundColor = clBlue
        print( "highlight button \(but.tag)" )
    }
    
    func initWeekdayButtons(){
        buttonMonday.layer.cornerRadius = 10
        buttonTuesday.layer.cornerRadius = 10
        buttonWednesday.layer.cornerRadius = 10
        buttonThursday.layer.cornerRadius = 10
        buttonFriday.layer.cornerRadius = 10
        buttonSaturday.layer.cornerRadius = 10
        buttonSunday.layer.cornerRadius = 10
        
        let dayOfWeek = getDayOfWeek()
        
        switch dayOfWeek{
            case 1:
                highlightWeekday( but: buttonSunday )
            case 2:
                highlightWeekday( but: buttonMonday )
            case 3:
                highlightWeekday( but: buttonTuesday )
            case 4:
                highlightWeekday( but: buttonWednesday )
            case 5:
                highlightWeekday( but: buttonThursday )
            case 6:
                highlightWeekday( but: buttonFriday )
            case 7:
                highlightWeekday( but: buttonSaturday )
            default:
                print("Error while determining day of week.");
        }
    }
    
    func getDayOfWeek() -> Int? {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.weekday, from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.layer.cornerRadius = 10
        navigationBar.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        
        toolBar.layer.cornerRadius = 10
        toolBar.layer.borderWidth = 1
        toolBar.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        toolBar.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        
        initWeekdayButtons()
        
        
        lblCity.text = "Munich"
        
    }


}

