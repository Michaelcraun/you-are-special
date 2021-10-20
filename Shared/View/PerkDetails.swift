//
//  PerkDetails.swift
//  you-are-special
//
//  Created by Michael Craun on 10/19/21.
//

import SwiftUI

struct PerkDetails: View {
    @ObservedObject var viewModel: PerkViewModel
    @Binding var isShown: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(viewModel.name)
                .font(.title3.bold().smallCaps())
            
            HStack {
                
                FirebaseImage(paths: viewModel.imagePaths)
                    .scaledToFit()
                    .padding()
                    .frame(minWidth: 150,
                           maxWidth: 200,
                           minHeight: 150,
                           maxHeight: 200)
                
                RankSelector(model: .init(rank: viewModel.rank, max: viewModel.maxRank))
                
            }
            
            if viewModel.rank > 0 {
                
                Text("Current")
                    .font(.callout.bold().smallCaps())
                
                Text(viewModel.description)
                
                Spacer()
                    .frame(height: 10)
                
            }
            
            Text("Next Rank")
                .font(.headline.bold().smallCaps())
            
            Text(viewModel.descriptionForNextRank)
            
        }
        .padding()
        .foregroundColor(.pipBoyText)
        .overlay { DetailDismisser(isShown: $isShown) }
        .background { DetailBackground() }
        .padding()
        .offset(y: isShown ? 0 : UIScreen.main.bounds.height * 1.5)
        .animation(.easeInOut, value: isShown)
        
    }
}
