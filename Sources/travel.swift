//
//  travel.swift
//  JSON-API-example
//
//  Created by Tony Silva on 18/10/16.
//
//

import PerfectHTTP
import Foundation

open class Travel {
    
    var data = [Place]()
    
    init(){
        //CODE
    }
    
    open func list() -> String {
        return toString()
    }
    
    open func add(_ request: HTTPRequest) -> String {
        let new = Place(
            destination     : request.param(name: "destination")!,
            timeStay        : request.param(name: "timeStay")!,
            location        : request.param(name: "location")!,
            description     : request.param(name: "description")!,
            comment         : request.param(name: "comment")!
        )
        data.append(new)
        return toString()
    }
    
    open func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: String]
            let new = Place(
                destination     : incoming["destination"]!,
                timeStay        : incoming["timeStay"]!,
                location        : incoming["location"]!,
                description     : incoming["description"]!,
                comment         : incoming["comment"]!
            )
            data.append(new)
        } catch {
            return "ERROR"
        }
        return toString()
    }
    
    fileprivate func toString() -> String {
        var out = [String]()
        for m in self.data {
            do {
                out.append(try m.jsonEncodedString())
            } catch {
                print(error)
            }
        }
        return "[\(out.joined(separator: ","))]"
    }
    
}

