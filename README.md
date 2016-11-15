# JSON API example

## Setup - Xcode 8

* Check out or download the project
* In terminal, navigate to the directory and execute

```
swift package generate-xcodeproj
```

* Open `JSON-API-example.xcodeproj`
* Open the ApplicationConfiguration.json file and change the token value to the WeatherUnderground token obtained above
* Add the file to a new "Copy Files" build phase in executable
* Select the executable build target from the build targets dropdown in Xcode
* Run (cmd-R) to build & run in Xcode

In Xcode's console output pane you will see:

```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* In a browser, visit [http://localhost:8181/](http://localhost:8181/)

## Setup - Terminal

* Check out or download the project
* In terminal, navigate to the directory
* Open the ApplicationConfiguration.json file and change the token value to the WeatherUnderground token obtained above.
* Execute `swift build`
* Once the project has compiled, execute `./.build/debug/JSON-API-example`, or
* Execute `swift build --configuration release`
* Once the project has compiled, execute `./.build/release/JSON-API-example`

The output you will see:

```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* In a browser, visit [http://localhost:8181/](http://localhost:8181/)

## Included Routes

The following routes are included in this API for demonstration purposes:

* GET: [http://localhost:8181/](http://localhost:8181/) - A HTML page is returned.
* GET: [http://localhost:8181/api/v1/travel](http://localhost:8181/api/v1/travel) - Returns a JSON list of travels.
* POST: [http://localhost:8181/api/v1/travel](http://localhost:8181/api/v1/travel) - Adds a travel to the internal mock object and returns the new array as JSON. Note the following POST params are expected: `destination`, `timeStay`, `location`, `description`, `comment`.
* POST: [http://localhost:8181/api/v1/travel/json](http://localhost:8181/api/v1/travel/json) - Accepts a raw body of JSON. Adds a new travel, returns the new list. JSON would be in the following format:

``` javascript
{
    "destination": "brazil",
    "timeStay": "30",
    "description": "good place",
    [...]
}
```

* GET: [http://localhost:8181/api/v1/wiki?country=countryToSearch&user=yourUser](http://localhost:8181/api/v1/wiki?country=countryToSearch&user=yourUser) - Returns a JSON info about the place using parameters in the URL.
* POST: [http://localhost:8181/api/v1/wiki](http://localhost:8181/api/v1/wiki) - Returns a JSON info about the place using parameters in the request.
* GET: [http://localhost:8181/api/v1/current/{country}/{city}](http://localhost:8181/api/v1/current/{country}/{city}) - Returns a JSON info about current weather using parameters in the url.
* GET: [http://localhost:8181/api/v1/forecast/{country}/{city}](http://localhost:8181/api/v1/forecast/{country}/{city}) - Returns a JSON info about forecast weather using parameters in the url.

## Postman Collection

The repo includes a file `JSON-API-example.postman_collection` which is a Postman URL collection.

With Postman installed, import and use to easily query the routes.
