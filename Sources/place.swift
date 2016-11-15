//
//  place.swift
//  JSON-API-example
//
//  Created by Tony Silva on 18/10/16.
//
//

import PerfectLib

class Place : JSONConvertibleObject {
    
    static let registerName = "place"
    
    var destination: String = ""
    var timeStay: String = ""
    var location: String = ""
    var description: String = ""
    var comment: String = ""
    
    var place: String {
        return "\(destination) \(location)"
    }
    
    init(destination: String, timeStay: String, location: String, description: String, comment: String) {
        self.destination    = destination
        self.timeStay       = timeStay
        self.location		= location
        self.description    = description
        self.comment        = comment
    }
    
    override open func setJSONValues(_ values: [String : Any]) {
        self.destination	= getJSONValue(named: "destination", from: values, defaultValue: "")
        self.timeStay		= getJSONValue(named: "timeStay", from: values, defaultValue: "")
        self.location		= getJSONValue(named: "location", from: values, defaultValue: "")
        self.description    = getJSONValue(named: "description", from: values, defaultValue: "")
        self.comment        = getJSONValue(named: "comment", from: values, defaultValue: "")
    }
    
    override open func getJSONValues() -> [String : Any] {
        return [
            "destination":destination,
            "timeStay":timeStay,
            "location":location,
            "description":description,
            "comment":comment
        ]
    }
    
}
