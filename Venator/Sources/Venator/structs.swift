//
//  structs.swift
//  Venator2
//
//  Created by defaultuser on 5/8/20.
//  Copyright © 2020 defaultuser. All rights reserved.
//

import Foundation

struct VenatorData: Encodable {
    //let begin_collection:String
    //var finish_collection:String?
    var system_info:SystemInfo?
    var launch_agents:Array<LaunchItem>?
    var launch_daemons:Array<LaunchItem>?
    var users:Array<User>?
    var system_integrity_protection:SIP?
    var gatekeeper:GateKeeper?
    var cron_jobs:Array<CronJob>?
    
    func toJson(data: VenatorData) -> String {
        let jsonData = try! JSONEncoder().encode(data)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString
    }
}

struct SystemInfo: Encodable {
    var hostname:String
    var uuid:String
    var kernel_info:String
    var os_ver:String
    var os_arch:String
}

struct SIP: Encodable {
    var hostname:String
    var uuid:String
    var status:String
}

struct GateKeeper: Encodable {
    var hostname:String
    var uuid:String
    var status:String
}

struct CronJob: Encodable {
    var hostname:String
    var uuid:String
    var user:String
    var crontab:String
}

struct SigningInfo: Encodable {
    var appleBinary:Bool
    var authority:Array<String>
    var status:String
}

struct LaunchItem: Encodable {
    var hostname:String
    var uuid:String
    var programArguments:String
    var programExecutable:String
    var programExecutableHash:String
    var signingInfo:SigningInfo
    var label:String
    var runAtLoad:Bool
}

struct User: Encodable {
    let hostname:String
    let uuid:String
    let username:String
    let isAdmin:Bool
}
