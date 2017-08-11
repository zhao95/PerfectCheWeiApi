//
//  BaseResponseModel.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/7.
//
//

import Foundation
import PerfectLib

struct ResponseName {
    static let responseCode = "responseCode"
    static let responseMessage = "responseMessage"
    static let responseData = "responseData"
}

class BaseResponseModel: JSONConvertibleObject {
    var responseCode:Int
    var responseMessage:String
    var responseData:Any?
    
    init(responseCode:Int, responseMessage:String, responseData:Any? = nil) {
        self.responseCode = responseCode
        self.responseMessage = responseMessage
        self.responseData = responseData
    }
    
    init(responseErrorType:ResponseErrorCode) {
        self.responseCode = responseErrorType.rawValue
        self.responseMessage = responseErrorType.message
    }
    
    override func setJSONValues(_ values: [String : Any]) {
        self.responseCode = getJSONValue(named: ResponseName.responseCode, from: values, defaultValue: 0)
        self.responseMessage = getJSONValue(named: ResponseName.responseMessage, from: values, defaultValue: "")
        self.responseData = getJSONValue(named: ResponseName.responseData, from: values, defaultValue: nil)
    }
    override func getJSONValues() -> [String : Any] {
        var dic:[String:Any] = [
            ResponseName.responseCode:self.responseCode,
            ResponseName.responseMessage:self.responseMessage
        ]
        if let responseData = self.responseData {
            dic[ResponseName.responseData] = responseData
        }
        return dic
    }
    
    static func programExecuteError() -> String {
        return "{\"\(ResponseName.responseCode)\":9999,\"\(ResponseName.responseMessage)\":\"程序执行错误!\"}"
    }
}




