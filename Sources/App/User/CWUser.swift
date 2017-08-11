//
//  CWUser.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/5.
//
//

import Foundation
import MySQLStORM
import StORM

class CWUser: BaseModel {
    var phone:String = ""
    override func to(_ this: StORMRow) {
        super.to(this)
        phone = this.data["phone"] as? String ?? ""
        self.makeRow()
    }
    
    func rows() -> [CWUser] {
        return self.baseRows(r: { () -> CWUser in
            return CWUser()
        })
    }
    
}
