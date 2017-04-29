//
//  Model.swift
//  SwiftmiKituraWeb
//
//  Created by yangyin on 2017/4/30.
//
//

import Foundation
import Fluent


public protocol Dictionaryable {
    func makeDictionary() throws -> [String : Any]
}

public protocol Model: Entity, Dictionaryable {}

extension Sequence where Iterator.Element: Dictionaryable {
    public func makeDictionary() throws -> [[String : Any]] {
        return try self.map { try $0.makeDictionary() }
    }
}
