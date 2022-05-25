//
//  File.swift
//  
//
//  Created by loki on 16.05.2022.
//

import Foundation

public extension Up {
    struct Tail {
        public struct Request : StreamRequest {
            public let user: String
            public let token: String
            public let streamID : String
            
            public init(user: String, token: String, streamID: String) {
                self.user = user
                self.token = token
                self.streamID = streamID
            }
        }
        
        public struct Response : Codable {
            public let tail : Date?
            
            public init(tail: Date?) {
                self.tail = tail
            }
        }
    }
}


