//
//  DetailBackground.swift
//  you-are-special
//
//  Created by Michael Craun on 10/18/21.
//

import SwiftUI

struct DetailBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.pipBoyBackground)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.pipBoyText)
            }
    }
}
