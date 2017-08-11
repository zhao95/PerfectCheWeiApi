//
//  ResponseErrorCode.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/7.
//
//

import Foundation

enum ResponseErrorCode:Int {
    case phoneNumberNotExist = 10000
    case phoneCodeNotExist = 10001
    case verificationCodeIncorrect = 10002
    case verificationCodeTimeOut = 10003
    var message:String {
        switch self {
        case .phoneNumberNotExist:
            return "手机号不存在"
        case .phoneCodeNotExist:
            return "手机验证码不存在!"
        case .verificationCodeIncorrect:
            return "验证码不正确！"
        case .verificationCodeTimeOut:
            return "验证码过期!"
        }
    }
}
