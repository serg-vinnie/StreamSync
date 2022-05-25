//
//  File.swift
//  
//
//  Created by loki on 16.05.2022.
//

import Foundation

public struct Up {
    public struct Request : StreamRequest {
        public let user: String
        public let token: String
        public let streamID : String
        public let events : [UpStreamEvent]
        
        public init(user: String, token: String, streamID : String, events : [UpStreamEvent]) {
            self.user = user
            self.token = token
            self.streamID = streamID
            self.events = events
        }
    }
    
    public struct Response : Codable {
        public let inserted : Int
        
        public init(inserted : Int) {
            self.inserted = inserted
        }
    }
}
