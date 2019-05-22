//
//  ViewController.swift
//  yrWeather
//
//  Created by Joerg Neugebauer on 19.05.19.
//  Copyright © 2019 Joerg Neugebauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //example url call to fetch weather forcast for Munich /Germany
    let urlWeatherLocationCountry:String = "Germany"
    let urlWeatherLocationRegion:String = "Bavaria"
    let urlWeatherLocationCity:String = "Munich"

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var toolBar: UIView!
    
    
    @IBOutlet weak var buttonSettings: UIButton!
    @IBOutlet weak var buttonFavorites: UIButton!
    @IBOutlet weak var buttonMonday: UIButton!
    @IBOutlet weak var buttonTuesday: UIButton!
    @IBOutlet weak var buttonWednesday: UIButton!
    @IBOutlet weak var buttonThursday: UIButton!
    @IBOutlet weak var buttonFriday: UIButton!
    @IBOutlet weak var buttonSaturday: UIButton!
    @IBOutlet weak var buttonSunday: UIButton!
    
    let SUN:Int = 1
    let MON:Int = 2
    let TUE:Int = 3
    let WED:Int = 4
    let THU:Int = 5
    let FRI:Int = 6
    let SAT:Int = 7

    
    let clBlue:CGColor = UIColor(red: 0/255.0, green: 153.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let clOrange:CGColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0).cgColor
    
    
    /**
     *
     */
    func loadWeatherData(){
        let urlCall = "https://www.yr.no/place/\(urlWeatherLocationCountry)/\(urlWeatherLocationRegion)/\(urlWeatherLocationCity)/forecast_hour_by_hour.xml"
        
        print(urlCall)
    }
    
    /**
     * 
     */
    @IBAction func weekdayClicked(_ sender: UIButton) {
        resetWeekday(but: buttonMonday)
        resetWeekday(but: buttonTuesday)
        resetWeekday(but: buttonWednesday)
        resetWeekday(but: buttonThursday)
        resetWeekday(but: buttonFriday)
        resetWeekday(but: buttonSaturday)
        resetWeekday(but: buttonSunday)
        
        highlightWeekday(but: sender)
    }
    

    /**
     * reset day of week button
     */
    func resetWeekday( but: UIButton) {
        but.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    /**
     * highlight day of week button
     */
    func highlightWeekday( but: UIButton) {
        but.layer.backgroundColor = clBlue
    }
    
    /**
     *
     */
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
    
    
    /**
     * function returns the current day of week as Integer
     *
     * Sun = 1
     * Mon = 2
     * Tue = 3
     * Wed = 4
     * Thu = 5
     * Fri = 6
     * Sat = 7
     */
    func getDayOfWeek() -> Int? {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.weekday, from: date)
    }
    
    /**
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolBar.layer.cornerRadius = 10
        toolBar.layer.borderWidth = 1
        toolBar.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        toolBar.layer.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.65).cgColor
        
        //lblCity.layer.borderWidth = 1
        //lblTemperature.layer.borderWidth = 1
        
        initWeekdayButtons()
        
        lblCity.text = "Munich"
        lblTemperature.text = "12° C"
        
    }


}

