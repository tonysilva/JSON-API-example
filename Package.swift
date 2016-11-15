//
//  Package.swift
//  JSON-API-example
//
//  Created by Tony Silva on 18/10/16.
//
//

import PackageDescription

let package = Package(
    name: "JSON-API-example",
    targets: [],
    dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/iamjono/JSONConfig.git", majorVersion: 0, minor: 1)
	]
)
