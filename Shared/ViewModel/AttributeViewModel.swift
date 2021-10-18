//
//  AttributeViewModel.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/18/21.
//

import SwiftUI

class AttributeViewModel: ObservableObject {
    @Published var attribute: Attribute
    @Published var imagePaths: [String] = []
    @Published var name: String = ""
    @Published var rank: Int = 0
    @Published var isShowingDetails: Bool = false
    
    var description: String { attribute.description }
    var maxRank: Int { attribute.maxRank }
    
    init(attribute: Attribute) {
        self.attribute = attribute
        
        self.imagePaths = attribute.imagePaths
        self.name = attribute.name
        self.rank = attribute.rank ?? 0
    }
}
