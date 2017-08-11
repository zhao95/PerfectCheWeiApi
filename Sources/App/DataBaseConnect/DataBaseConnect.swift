//
//  DataBaseConnect.swift
//  PerfectCheWeiApi
//
//  Created by 张行 on 2017/8/5.
//
//

import Foundation
import MySQLStORM

class DataBaseConnect {
    static func setup() {
        MySQLConnector.host = "127.0.0.1"
        MySQLConnector.port = 3306
        MySQLConnector.username = "admin"
        MySQLConnector.password = "1990823"
        MySQLConnector.database = "che_wei"
        setupTable(storm: CWUser())
        setupTable(storm: CWPhoneCode())
    }
    
    static func setupTable(storm:MySQLStORM) {
        do {
            try storm.setupTable()
        } catch {
            print("\(storm.table())表初始化失败")
        }
    }
    
}
