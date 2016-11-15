//
//  getToken.swift
//  JSON-API-example
//
//  Created by Tony Silva on 01/11/16.
//
//

import JSONConfig

func getToken() -> String {
    if let config = JSONConfig(name: "\(FileRoot)ApplicationConfiguration.json") {
        let dict = config.getValues()!
        guard let apiToken = dict["token"] else {
            print("Unable to get API Token")
            return ""
        }
        return apiToken as! String
    } else {
        print("Unable to get Configuration")
    }
    return ""
}
