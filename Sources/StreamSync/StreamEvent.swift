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
    var _id             : BSONObjectID?
    let author          : String
    let version         : Int
    let createdAt       : Date
    let receivedAt      : Date
    
    let content         : Data
    
    
    init(author: String, content: Data, version: Int, createdAt: Date) {
        self.author = author
        self.content = content
        self.version = version
        self.receivedAt = Date()
        self.createdAt = createdAt
    }
}
