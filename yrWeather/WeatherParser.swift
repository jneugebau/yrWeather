//
//  WeatherParser.swift
//  yrWeather
//
//  Created by Joerg Neugebauer on 22.05.19.
//  Copyright © 2019 Joerg Neugebauer. All rights reserved.
//

import Foundation

struct forecastItem{
    var from: String
    var to: String
    var symbol: String
    var temperature: Double
}

class WeatherParser: NSObject, XMLParserDelegate
{
    
    let urlWeatherLocationCountry:String = "Germany"
    let urlWeatherLocationRegion:String = "Bavaria"
    let urlWeatherLocationCity:String = "Munich"
    
    var forecastItems:[forecastItem] = []
    
    private var currentElement: String = ""
    
    private var currentTitle: String = "" {
        didSet{
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentDescription: String = "" {
        didSet{
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentPubDate: String = "" {
        didSet{
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    func parseWeatherData() {
        let yrUrl = "https://www.yr.no/place/\(urlWeatherLocationCountry)/\(urlWeatherLocationRegion)/\(urlWeatherLocationCity)/forecast_hour_by_hour.xml"
        let request = URLRequest(url: URL(string: yrUrl)!)
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data  = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            
            // parse xml data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        currentElement = elementName
        if currentElement == "time" {
            forecastItems.append(forecastItem(from: "", to: "", symbol: "", temperature: 0.0))
        }
    }
}
