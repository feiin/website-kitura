import Foundation
import Kitura
import Fluent
import FluentMySQL
import SwiftyJSON
import LoggerAPI

public final class ArticleController {
    
    public class func list(request: RouterRequest, response: RouterResponse, next: () -> Void) throws {
        
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
            
            let pager =  ["totalPage":pages,"pageSize":pageSize, "currentPage":pn, "totalCount":totalCount,"nextPage":pn+1,"prevPage":pn-1]
            try response.render("article_list.stencil", context: ["articles":articles,"pager":pager]).end()
            
        }catch QueryError.notSupported(let msg) {
            Log.info(msg)
        }
    }
    
    public class func detail(request: RouterRequest, response: RouterResponse, next: () -> Void)  throws {
        var articleId = 0
        if let id = request.parameters["id"]?.int {
            articleId = id
        }
        if(articleId == 0) {
            return try response.status(.notFound).end()
        }
        
        let article = try Article.find(articleId)?.makeDictionary()
        if article == nil {
            return try response.status(.notFound).end()
        }
        try response.render("article_detail.stencil", context: ["article":article!]).end()
    }
    
}