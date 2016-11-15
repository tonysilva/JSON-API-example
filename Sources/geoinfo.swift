//
//  geoinfo.swift
//  JSON-API-example
//
//  Created by Tony Silva on 21/10/16.
//
//

import PerfectHTTP
import Foundation

open class Geoinfo {
    
    // Register listen for wikipediaSearch
    static var json:[String : Any] = [:] {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jsonFetched"), object: nil)
        }
    }
    
    // DataTask is an asynchronous operation. Which means that it can return later after executing your function
    static func wikipediaSearch(_ request: HTTPRequest)-> String {
        let country = request.param(name: "country")!,
        user = request.param(name: "user")!
        var request = URLRequest(url: URL(string: "http://api.geonames.org/wikipediaSearchJSON?q=\(country)&maxRows=5&username=\(user)")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
            Geoinfo.json = json
            }.resume()
        return try! Geoinfo.json.jsonEncodedString()
    }

    static func wikipediaSearch_(_ request: HTTPRequest)-> String {
        var dic: [String: String] = ["country":" ", "user":" "]
        _ = request.queryParams.map { key, value in
         dic[key] = value
        }
        var request = URLRequest(url: URL(string: "http://api.geonames.org/wikipediaSearchJSON?q=\(dic["country"]!)&maxRows=5&username=\(dic["user"]!)")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        session.dataTask(with: request) {data, response, err in
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
            Geoinfo.json = json
            }.resume()
        return try! Geoinfo.json.jsonEncodedString()
    }
    
    // For the use of special character
    static func encodedUrl(_ originalUrl: String) -> URL {
        // example "http://www.geonames.org/search.html?q=Aïn+Béïda+Algeria&country="
        if let encoded = originalUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encoded)
        {
            return url
        }
        return URL(string: "/")!
    }
    
}
