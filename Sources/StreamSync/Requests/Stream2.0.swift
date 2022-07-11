//
//  File.swift
//  
//
//  Created by Loki on 06.07.2022.
//

import Foundation

public struct CheckIDs {
    public struct Request : StreamRequest {
        public let token         : String
        public let user          : String
        public let streamID      : String
    
        public let IDs          : [String]
        
        public init(token: String, user: String, streamID: String, IDs: [String]) {
            self.token      = token
            self.user       = user
            self.streamID   = streamID
            self.IDs        = IDs
        }
    }
    
    // Response [String] of non existing ids
}

public struct Push {
    public struct Request : StreamRequest {
        public let token         : String
        public let user          : String
        public let streamID      : String
        public let safe          : Bool
        
        public let events        : [PushEvent]
        
        public init(token: String, user: String, streamID: String, safe: Bool, events: [PushEvent]) {
            self.token      = token
            self.user       = user
            self.streamID   = streamID
            self.safe       = safe
            self.events     = events
        }
    }
    
    public struct Response : Codable {
        public let inserted : Int
        
        public init(inserted : Int) {
            self.inserted = inserted
        }
    }
}

public struct Pull {
    public struct Request : StreamRequest {
        public let token         : String
        public let user          : String
        public let streamID      : String
        
        public let start : Date
        public let end   : Date
        
        public init(token: String, user: String, streamID: String, start: Date, end: Date) {
            self.token      = token
            self.user       = user
            self.streamID   = streamID
            self.start      = start
            self.end        = end
        }
    }
    
    // Response [StreamEvent] of non existing ids
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
    
    public init(pushEvent event: PushEvent, address: String?) {
        self._id        = event.id
        self.author     = event.author
        self.content    = event.content
        self.version    = event.version
        self.receivedAt = Date()
        self.createdAt  = event.createdAt
        self.address    = address
    }
    
//    public init(author: String, content: Data, version: Int, createdAt: Date) {
//        self.author = author
//        self.content = content
//        self.version = version
//        self.receivedAt = Date()
//        self.createdAt = createdAt
//    }
}
