//
//  main.swift
//  JSON-API-example
//
//  Created by Tony Silva on 18/10/16.
//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// setting path to ApplicationConfiguration.json
#if os(Linux)
    let FileRoot = "/home/ubuntu/settings/"
#else
    let FileRoot = ""
#endif

let apiRoute = "/api/v1/"
let apiToken = getToken()

let server = HTTPServer()
var routes = Routes()

let travel = Travel()

routes.add(method: .get, uri: "/", handler: {
	request, response in
	response.setHeader(.contentType, value: "text/html")
	response.appendBody(string: "<html><title>Welcome, bro!</title><body>Welcome, bro!<br/>" +
        "<h3>JSON API - Example</h3>" +
        "<table style='width:100%'>" +
        "<tr><th>verb</th><th>uri</th><th>description</th></tr>" +
        "<tr><td>GET</td><td>/</td><td>A HTML page is returned</td></tr>" +
        "<tr><td>GET</td><td>/api/v1/travel</td><td>retrieve all travels</td></tr>" +
        "<tr><td>POST</td><td>/api/v1/travel</td><td>insert a travel (request param)</td></tr>" +
        "<tr><td>POST</td><td>/api/v1/travel/json</td><td>insert a travel (raw json)</td></tr>" +
        "<tr><td>POST</td><td>/api/v1/wiki</td><td>retrieve info about the place (request param)</td></tr>" +
        "<tr><td>GET</td><td>/api/v1/wiki?country={country}&user={user}</td><td>retrieve info about the place (url param)</td></tr>" +
        "<tr><td>GET</td><td>/api/v1/current/{country}/{city}</td><td>retrieve info about current weather (url param)</td></tr>" +
        "<tr><td>GET</td><td>/api/v1/forecast/{country}/{city}</td><td>retrieve info about forecast weather (url param)</td></tr>" +
        "</table>" +
        "<h3>INFO</h3>" +
        "<div><span>Web Server: Perfect 2.0</span></div>" +
        "<div><span>Programming Language: Swift 3</span></div>" +
        "</body></html>")
	response.completed()
	}
)

routes.add(method: .get, uri: "/api/v1/travel", handler: {
	request, response in
	response.setHeader(.contentType, value: "application/json")
	response.appendBody(string: travel.list())
	response.completed()
	}
)

routes.add(method: .post, uri: "/api/v1/travel", handler: {
	request, response in
	response.setHeader(.contentType, value: "application/json")
	response.appendBody(string: travel.add(request))
	response.completed()
	}
)

routes.add(method: .post, uri: "/api/v1/travel/json", handler: {
	request, response in
	response.setHeader(.contentType, value: "application/json")
	response.appendBody(string: travel.add(request.postBodyString!))
	response.completed()
	}
)

routes.add(method: .post, uri: "/api/v1/wiki", handler: {
    request, response in
    response.setHeader(.contentType, value: "application/json")
    response.appendBody(string: Geoinfo.wikipediaSearch(request))
    response.completed()
    }
)

routes.add(method: .get, uri: "/api/v1/wiki", handler: {
    request, response in
    response.setHeader(.contentType, value: "application/json")
    response.appendBody(string: Geoinfo.wikipediaSearch_(request))
    response.completed()
    }
)

routes.add(method: .get, uris: ["\(apiRoute)current/","/api/v1/current/{country}/{city}"], handler: {
    request, response in
    
    let country = request.urlVariables["country"] ?? "Brasil"
    let city = request.urlVariables["city"] ?? "Brasilia"
    
    response.setHeader(.contentType, value: "application/json")
    response.appendBody(string: Weather.getCurrent("\(country)/\(city)"))
    response.completed()
    }
)

routes.add(method: .get, uris: ["\(apiRoute)forecast","/api/v1/forecast/{country}/{city}"], handler: {
    request, response in
    
    let country = request.urlVariables["country"] ?? "Brasil"
    let city = request.urlVariables["city"] ?? "Brasilia"
    
    response.setHeader(.contentType, value: "application/json")
    response.appendBody(string: Weather.getForecast("\(country)/\(city)"))
    response.completed()
    }
)

server.addRoutes(routes)
server.serverPort = 8181

do {
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
