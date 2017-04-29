//
//  File.swift
//  SwiftmiKituraWeb
//
//  Created by yangyin on 2017/4/27.
//
//
import Fluent
import Foundation


public final class Article: Model {
    public var id: Node?
    var content: String
    var title: String
    var author:String?
    var sourceName:String?
    var createDate:Date?
    var sourceUrl:String?
    var viewCount:Int?
    
    public static let entity = "article"
   public static let idKey = "articleId"
   public var exists: Bool = true
    
    init(title:String, content: String) {
        self.title = title
        self.content = content
    }
    
  public  init(node: Node, in context: Context) throws {
        id = try node.extract("articleId")
        content = try node.extract("content")
        title = try node.extract("title")
        author = try node.extract("author")
        sourceName = try node.extract("sourceName")
        
        if let raw = node["createDate"]?.string {
            if let date = dateFormatter.date(from: raw) {
                self.createDate = date
            }
            
        }
        sourceUrl = try node.extract("sourceUrl")
        viewCount = try node.extract("viewCount")
        
    }
    
   public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "articleId": id,
            "content": content,
            "title":title,
            "author":author,
            "sourceName":sourceName,
            "sourceUrl":sourceUrl,
            "viewCount":viewCount,
            "createDate": dateFormatter.string(from: createDate!)
            ])
    }
    
    public func makeDictionary() throws -> [String : Any] {
        var result = [String : Any]()
        result["articleId"] = id?.int
        result["content"] = content
        return result
    }
}


extension Article: Preparation {
  public  static func prepare(_ database: Database) throws {
        //
    }
    
  public  static func revert(_ database: Database) throws {
        //
    }
}

private var _df: DateFormatter?
private var dateFormatter: DateFormatter {
    if let df = _df {
        return df
    }
    
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    _df = df
    return df
}

