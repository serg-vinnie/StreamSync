//
//  File.swift
//  
//
//  Created by Loki on 06.07.2022.
//

import Foundation

public struct CheckIDsRequest : StreamRequest {
    public let token         : String
    public let user          : String
    public let streamID      : String
    
    public let IDs          : [String]
    
    // Response [String]
}
