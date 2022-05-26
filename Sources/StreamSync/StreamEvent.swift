import Foundation
import SwiftBSON

public struct UpStreamEvent : Codable {
    public let author          : String
    public let version         : Int
    public let createdAt       : Date

    public let content         : Data
    
    public init(author: String, version: Int, createdAt: Date, content: Data) {
        self.author = author
        self.version = version
        self.createdAt = createdAt
        self.content = content
    }
}

public struct DownStreamEvent : Codable {
    public var _id             : BSONObjectID?
    public let author          : String
    public let version         : Int
    public let createdAt       : Date
    public let receivedAt      : Date
    public let address         : String?
    
    public let content         : Data
    
    public init(upStreamEvent up: UpStreamEvent, address: String?) {
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
