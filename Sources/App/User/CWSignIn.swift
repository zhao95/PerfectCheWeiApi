//
//  CWSignIn.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/8.
//
//

import Foundation
import PerfectLib
import PerfectHTTP

class CWSignIn: AddRoutes {
    static func method() -> HTTPMethod {
        return HTTPMethod.post
    }
    
    static func url() -> String {
        return "user/signIn"
    }
    
    static func setResponse(request: HTTPRequest, response: HTTPResponse) throws -> String {
        guard let phone = request.param(name: "phone") else {
            return try BaseResponseModel(responseErrorType: ResponseErrorCode.phoneNumberNotExist).jsonEncodedString()
        }
        guard let code = request.param(name: "code") else {
            return try BaseResponseModel(responseErrorType: ResponseErrorCode.phoneCodeNotExist).jsonEncodedString()
        }
        let phoneCode = CWPhoneCode()
        try phoneCode.select(whereclause: "phone = ? AND code = ?", params: [phone,code], orderby: ["Id"])
        guard let row = phoneCode.rows().last  else {
            return try BaseResponseModel(responseErrorType: ResponseErrorCode.verificationCodeIncorrect).jsonEncodedString()
        }
        guard code == row.code else {
            return try BaseResponseModel(responseErrorType: ResponseErrorCode.verificationCodeIncorrect).jsonEncodedString()
        }
        guard let codeDate = row.lastUpdateDate.date() else {
            return BaseResponseModel.programExecuteError()
        }
        guard Date().compare(codeDate) == ComparisonResult.orderedAscending else {
            return try BaseResponseModel(responseErrorType: ResponseErrorCode.verificationCodeTimeOut).jsonEncodedString()
        }
        let user = CWUser()
        user.phone = phone
        do {
            try? user.save(set: { (id) in
                user.Id = id as! Int
            })
            return try BaseResponseModel(responseCode: 200, responseMessage: "登录成功！", responseData: ["userId:":user.Id]).jsonEncodedString()
        } catch {
            return BaseResponseModel.programExecuteError()
        }
    }
}
