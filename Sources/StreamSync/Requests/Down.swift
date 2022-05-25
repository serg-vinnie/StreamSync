//
//  File.swift
//  
//
//  Created by loki on 16.05.2022.
//

import Foundation

public struct Down {
    public struct Request : StreamRequest {
        public let user: String
        public let token: String
        public let streamID : String
        public let olderThan : Date
        public let count : Int
        
        public init(user: String, token: String, streamID: String, olderThan: Date, count: Int) {
            self.user = user
            self.token = token
            self.streamID = streamID
            self.olderThan = olderThan
            self.count = count
        }
    }
    
    // Response [DownStreamEvent]
}
