//
//  RequestLogger.swift
//  SwiftmiKituraWeb
//
//  Created by yangyin on 2017/4/23.
//
//

import Foundation
import Kitura
import LoggerAPI


public class  RequestLogger: RouterMiddleware {
    
    public  init() {
        
    }
    
    public func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
    
        let requestLine = "\(request.remoteAddress) \(request.method) \(request.urlURL) HTTP/\(request.httpVersion.major).\(request.httpVersion.minor)"
        Log.info(requestLine)
        next()
        
    }
}
