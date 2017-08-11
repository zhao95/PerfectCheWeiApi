//
//  AddRoutes.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/5.
//
//

import Foundation
import PerfectHTTPServer
import PerfectHTTP

protocol AddRoutes {
    static func addRoutesInServer(server:HTTPServer)
    static func addRoute() -> Route
    static func setResponse(request:HTTPRequest, response:HTTPResponse) throws -> String
    static func method() -> HTTPMethod
    static func url() -> String
}

extension AddRoutes {
    static func addRoutesInServer(server:HTTPServer) {
        var routes = Routes()
        routes.add(addRoute())
        server.addRoutes(routes)
    }
    
    static func method() -> HTTPMethod {
        return HTTPMethod.get
    }
    
    static func addRoute() -> Route {
        return Route(method: method(), uri: "api/\(url())", handler: { (request, response) in
            do {
                let json = try self.setResponse(request: request, response: response)
                response.setBody(string: json)
            } catch {
                response.setBody(string: BaseResponseModel.programExecuteError())
            }
            response.completed()
        })
    }
}
