//
//  weather.swift
//  JSON-API-example
//
//  Created by Tony Silva on 01/11/16.
//
//

import PerfectLib

class Weather {
    
    static func getCurrent(_ location: String = "Canada/Newmarket") -> String {
        
        let data = getEndpoint(endpoint: "http://api.wunderground.com/api/\(apiToken)/conditions/q/\(location).json")
        let current_observation = data["response"] as? [String: Any]
        var current = [String:Any]()
        current["observation_time"]	= current_observation?["results"]
        
        do {
            return try current.jsonEncodedString()
        } catch {
            return "[\(error)]"
        }
    }
    
    static func getForecast(_ location: String) -> String {
        
        let data = getEndpoint(endpoint: "http://api.wunderground.com/api/\(apiToken)/forecast/q/\(location).json")
        let forecast_observation = data["response"] as? [String: Any]
        var forecast = [String:Any]()
        forecast["observation_time"] = forecast_observation?["results"]
        
        do {
            return try forecast.jsonEncodedString()
        } catch {
            return "[\(error)]"
        }
    }
    
}
