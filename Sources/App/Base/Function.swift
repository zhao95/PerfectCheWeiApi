//
//  Function.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/10.
//
//

import Foundation

extension Date {
    func string() ->String {
        return dateFormatter().string(from: self)
    }
}

extension String {
    func date() -> Date? {
        return dateFormatter().date(from: self)
    }
}

func dateFormatter() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-DD HH:mm:ss +z"
    let local = Locale(identifier: "zh")
    dateFormatter.locale = local
    return dateFormatter
}
