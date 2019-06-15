//
//  StringInterpolation+Various.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 15/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation<T>(_ value: T?) {
        if let value = value {
            appendLiteral("\(value)")
        } else {
            appendLiteral("")
        }
    }
}
