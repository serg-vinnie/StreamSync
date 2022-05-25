//
//  File.swift
//  
//
//  Created by loki on 25.05.2022.
//

import Foundation

public struct SetReqeust : BasicRequest {
    public let token: String
    public let user: String
    public let storageData : StorageData
    
    public init(token: String, user: String, storageData: StorageData) {
        self.token = token
        self.user = user
        self.storageData = storageData
    }
}

public struct GetRequest : BasicRequest {
    public let token   : String
    public let user    : String
    public let key     : String
    
    public init(token: String, user: String, key: String) {
        self.token = token
        self.user = user
        self.key = key
    }
}

struct GetResponse : Codable {
    let storageData : StorageData?
    
    public init(storageData : StorageData?) {
        self.storageData = storageData
    }
}

public struct StorageData : Codable {
    public let key          : String
    public let content      : Data
    
    public init(key: String, content: Data) {
        self.key = key
        self.content = content
    }
}
