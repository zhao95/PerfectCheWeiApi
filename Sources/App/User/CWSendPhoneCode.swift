//
//  CWSendPhoneCode.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/10.
//
//

import Foundation
import PerfectHTTP
import PerfectLib

class CWSendPhoneCode: AddRoutes {
    static func method() -> HTTPMethod {
        return HTTPMethod.post
    }
    
    static func url() -> String {
        return "user/sendPhoneCode"
    }
    
    static func setResponse(request: HTTPRequest, response: HTTPResponse) throws -> String {
        guard let phone = request.param(name: "phone") else {
            return try BaseResponseModel(responseErrorType: .phoneNumberNotExist).jsonEncodedString()
        }
        let code = CWPhoneCode()
        code.phone = phone
        code.code = "1234"
        do {
            try code.save()
            return try BaseResponseModel(responseCode: 200, responseMessage: "验证码已经发送！").jsonEncodedString()
        } catch {
            return BaseResponseModel.programExecuteError()
        }
    }
}
