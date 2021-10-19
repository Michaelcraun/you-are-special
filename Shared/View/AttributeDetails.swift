//
//  AttributeDetails.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct AttributeDetails: View {
    @StateObject var viewModel: AttributeViewModel
    @Binding var isShown: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(viewModel.name)
            
            HStack {
                
                FirebaseImage(paths: viewModel.imagePaths)
                    .scaledToFit()
                    .padding()
                    .frame(minWidth: 150,
                           maxWidth: 200,
                           minHeight: 150,
                           maxHeight: 200)
                
                RankSelector(rank: $viewModel.rank, max: viewModel.maxRank)
                
            }
                
            Text(viewModel.description)
            
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

struct AttributeDetails_Previews: PreviewProvider {
    static var previews: some View {
        AttributeDetails(
            viewModel: AttributeViewModel(attribute: Attribute(), perks: []),
            isShown: .constant(true))
    }
}
