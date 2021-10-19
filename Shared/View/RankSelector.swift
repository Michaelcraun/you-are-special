//
//  RankSelector.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct RankSelector: View {
    @Binding var rank: Int
    let max: Int
    
    var body: some View {
        
        VStack {
            
            Button {
                if rank < max {
                    print("increasing rank to \(rank + 1)")
                    rank += 1
                }
            } label: {
                Image(systemName: "chevron.up")
                    .padding()
            }
            
            Text("\(rank)")
                .font(.largeTitle)
                .padding()
            
            Button {
                if rank > 0 {
                    print("decreasing rank to \(rank - 1)")
                    rank -= 1
                }
            } label: {
                Image(systemName: "chevron.down")
                    .padding()
            }
            
        }
        
    }
}

struct RankSelector_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            RankSelector(rank: .constant(0), max: 10)
            RankSelector(rank: .constant(2), max: 10)
        }
    }
}
