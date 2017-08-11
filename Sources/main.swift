//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

DataBaseConnect.setup()

let server = HTTPServer()
server.serverPort = 8181
var routes = Routes()
routes.add(method: .get, uri: "/") { (request, response) in
    response.setBody(string: "Hello,Word!")
    response.completed()
}
CWSignIn.addRoutesInServer(server: server)
CWSendPhoneCode.addRoutesInServer(server: server)
server.addRoutes(routes)
do {
    try server.start()
} catch {
    print("服务器启动失败!")
}

