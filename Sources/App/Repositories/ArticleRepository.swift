import Foundation
import Fluent
import FluentMySQL

class ArticleRepository {
    
    class func GetArticleList(_ pageIndex:Int,pageSize:Int) throws -> [String:Any] {
        
        let articles = try Article.query().limit(pageSize,withOffset: (pageIndex-1)*pageSize).run().makeDictionary()
        let totalCount = try Article.query().count()
        
        var pages = Int(totalCount / pageSize)
        if pages * pageSize < totalCount {
            pages += 1
        }
        
        let pager =  ["totalPage":pages,"pageSize":pageSize, "currentPage":pageIndex, "totalCount":totalCount,"nextPage":pageIndex+1,"prevPage":pageIndex-1]
        return ["articles":articles,"pager":pager]
        
    }
}
