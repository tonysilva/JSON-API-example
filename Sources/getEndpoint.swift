//
//  getEndpoint.swift
//  JSON-API-example
//
//  Created by Tony Silva on 01/11/16.
//
//

import Foundation

var json:[String : Any] = [:] {
    didSet {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jsonFetched"), object: nil)
    }
}

func getEndpoint(endpoint: String) -> [String: Any] {
    var request = URLRequest(url: URL(string: "\(endpoint)")!)
    request.httpMethod = "GET"
    let session = URLSession.shared
    session.dataTask(with: request) {data, response, err in
        print(data as Any)
        json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
    }.resume()
    return json
}
