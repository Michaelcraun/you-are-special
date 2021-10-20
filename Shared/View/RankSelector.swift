//
//  RankSelector.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct RankSelector: View {
    class RankModel: ObservableObject {
        @State var rank: Int
        let max: Int
        
        init(rank: Int, max: Int) {
            self.max = max
            self.rank = rank
        }
        
        func decrease() {
            if rank > 0 {
                print("Decreasing rank to \(rank - 1)...")
                rank -= 1
            }
        }
        
        func increase() {
            if rank < max {
                print("Increasing rank to \(rank + 1)...")
                rank += 1
            }
        }
    }
    
    @State var model: RankModel
    
    var body: some View {
        
        VStack {
            
            Button {
                model.increase()
            } label: {
                Image(systemName: "chevron.up")
                    .padding()
            }
            
            Text("\(model.rank)")
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .padding()
            
            Button {
                model.decrease()
            } label: {
                Image(systemName: "chevron.down")
                    .padding()
            }
            
        }
        .onChange(of: model.rank) { newValue in
            print("rank is now", newValue)
        }
        
    }
}

struct RankSelector_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
//            RankSelector(model: .init(rank: .constant(0), max: 10))
//            RankSelector(model: .init(rank: .constant(0), max: 3))
            RankSelector(model: .init(rank: 0, max: 10))
            RankSelector(model: .init(rank: 0, max: 3))
        }
    }
}
