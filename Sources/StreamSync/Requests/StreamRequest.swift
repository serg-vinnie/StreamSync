//
//  File.swift
//  
//
//  Created by loki on 16.05.2022.
//

import Foundation

public protocol BasicRequest : Codable {
    var token         : String { get }
    var user          : String { get }
}

public protocol StreamRequest : BasicRequest {
    var token         : String { get }
    var user          : String { get }
    var streamID      : String { get }
}

public struct SimpleRequest : StreamRequest {
    public let streamID      : String
    public let token         : String
    public let user          : String
    
    public init(streamID: String, token: String, user: String) {
        self.streamID = streamID
        self.token = token
        self.user = user
    }
}
