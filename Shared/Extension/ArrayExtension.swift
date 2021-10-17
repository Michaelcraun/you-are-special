//
//  ArrayExtension.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import Foundation

extension Array {
    func contains<T:Comparable>(all: [T]) -> Bool {
        for element in all {
            if !self.contains(where: {
                guard let t = $0 as? T else { return false }
                return t == element
            }) {
                return false
            }
        }
        return true
    }
}
