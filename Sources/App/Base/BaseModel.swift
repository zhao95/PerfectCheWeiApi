//
//  BaseModel.swift
//  PerfectCheWeiApi
//
//  Created by 君赏 on 2017/8/10.
//
//

import Foundation
import MySQLStORM
import StORM

class BaseModel: MySQLStORM {
    var Id:Int = 0
    var creatDate:String = Date().string()
    var lastUpdateDate:String = Date().string()
    override init() {
        super.init()
    }
    
    override func to(_ this: StORMRow) {
        Id = this.data["Id"] as? Int ?? 0
        creatDate = this.data["creatDate"] as? String ?? ""
        lastUpdateDate = this.data["lastUpdateDate"] as? String ?? ""
    }
    
    func baseRows<T:BaseModel>(r:@escaping ((Void) -> T)) -> [T] {
        var rows:[T] = []
        for data in self.results.rows {
            let row = r()
            row.to(data)
            rows.append(row)
        }
        return rows
    }
}
