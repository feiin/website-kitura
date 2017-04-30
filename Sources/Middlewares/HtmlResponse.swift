//
//  HtmlResponse.swift
//  SwiftmiKituraWeb
//
//  Created by yangyin on 2017/4/30.
//
//

import Foundation
import Kitura

public class  HtmlResponse: RouterMiddleware {
    
    public  init() {
        
    }
    
    public func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        //should remove when Kitura fixed this problem
        response.headers.setType("html", charset: "utf-8")
        next()
    }
}
