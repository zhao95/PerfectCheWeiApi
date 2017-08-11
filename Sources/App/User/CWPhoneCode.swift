//
//  CWPhoneCode.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/8.
//
//

import Foundation
import MySQLStORM
import StORM

class CWPhoneCode:BaseModel {

    var phone:String = ""
    var code:String = ""
    
    override init() {
        super.init()
        self.lastUpdateDate = Date(timeIntervalSinceNow: 5 * 60).string()
    }
    
    override func to(_ this: StORMRow) {
        super.to(this)
        phone = this.data["phone"] as? String ?? ""
        code = this.data["code"] as? String ?? ""
    }
    
    func rows() -> [CWPhoneCode] {
        return self.baseRows(r: { () -> CWPhoneCode in
            return CWPhoneCode()
        })
    }
}
