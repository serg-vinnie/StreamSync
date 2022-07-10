//
//  File.swift
//  
//
//  Created by Loki on 06.07.2022.
//

import Foundation

public struct CheckIDs {
    struct Request : StreamRequest {
        public let token         : String
        public let user          : String
        public let streamID      : String
    
        public let IDs          : [String]
    }
    
    // Response [String] of non existing ids
}

public struct Push {
    public struct Request : StreamRequest {
        public let token         : String
        public let user          : String
        public let streamID      : String
        
        public let IDs          : [PushEvent]
    }
    
    public struct Response : Codable {
        public let inserted : Int
        
        public init(inserted : Int) {
            self.inserted = inserted
        }
    }
}

public struct PushEvent : Codable {
    public var id             : String
    public let author          : String
    public let version         : Int
    public let createdAt       : Date

    public let content         : Data
    
    public init(id: String, author: String, version: Int, createdAt: Date, content: Data) {
        self.id = id
        self.author = author
        self.version = version
        self.createdAt = createdAt
        self.content = content
    }
}

public struct StreamEvent : Codable {
    public var _id             : String
    public let author          : String
    public let version         : Int
    public let createdAt       : Date
    public let receivedAt      : Date
    public let address         : String?
    
    public let content         : Data
    
    public init(upStreamEvent up: PushEvent, address: String?) {
        self._id = up.id
        self.author = up.author
        self.content = up.content
        self.version = up.version
        self.receivedAt = Date()
        self.createdAt = up.createdAt
        self.address = address
    }
    
//    public init(author: String, content: Data, version: Int, createdAt: Date) {
//        self.author = author
//        self.content = content
//        self.version = version
//        self.receivedAt = Date()
//        self.createdAt = createdAt
//    }
}
