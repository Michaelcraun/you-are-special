//
//  RankSelector.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct RankSelector: View {
    
    class RankDetails: ObservableObject {
        @State var rank: Int
        let max: Int
        
        
    }
    @Binding var rank: Int
    let max: Int
    
    var body: some View {
        
        VStack {
            
            Button {
                if rank < max { rank = rank + 1 }
            } label: {
                Image(systemName: "chevron.up")
                    .padding()
            }
            
            Text("\(rank)")
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .padding()
            
            Button {
                if rank > 0 { rank = rank - 1 }
            } label: {
                Image(systemName: "chevron.down")
                    .padding()
            }
            
        }
        .onChange(of: rank) { newValue in
            print(rank, "is now", newValue)
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
