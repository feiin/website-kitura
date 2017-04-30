import Foundation
import Kitura
import Models
import Fluent
import FluentMySQL
import SwiftyJSON
import LoggerAPI

public final class ArticleController {
    
   public class func List(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        
        var pn = 1
        let pageSize = 10;
        do
        {
            let articles = try Article.query().limit(10).run().makeDictionary()
            try response.render("articles/article_list.stencil", context: ["articles":articles]).end()
        
           // try response.status(.OK).send(json: JSON(articles)).end()
            
        }catch QueryError.notSupported(let msg) {
            Log.info(msg)
        }
    }
}
