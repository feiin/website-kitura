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
        if let page = request.queryParameters["pn"]?.int {
            pn = page
        }
        do
        {
            let articles = try Article.query().limit(10,withOffset: (pn-1)*pageSize).run().makeDictionary()
            let totalCount = try Article.query().count()

            var pages = Int(totalCount / pageSize)
            if pages * pageSize < totalCount {
                pages += 1
            }

            var pager =  ["totalPage":pages,"pageSize":pageSize, "currentPage":pn, "totalCount":totalCount,"nextPage":pn+1,"prevPage":pn-1]
            try response.render("article_list.stencil", context: ["articles":articles,"pager":pager]).end()
        
           // try response.status(.OK).send(json: JSON(articles)).end()
            
        }catch QueryError.notSupported(let msg) {
            Log.info(msg)
        }
    }
}
