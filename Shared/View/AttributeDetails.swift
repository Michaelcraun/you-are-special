//
//  AttributeDetails.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct AttributeDetails: View {
    @Binding var attribute: Attribute
    @Binding var isShown: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(attribute.name)
            
            HStack {
                
                FirebaseImage(paths: attribute.imagePaths)
                    .scaledToFit()
                    .padding()
                    .frame(minWidth: 150, maxWidth: 200, minHeight: 150, maxHeight: 200)
                
                RankSelector(rank: $attribute.rank, max: attribute.maxRank)
                
            }
                
            Text(attribute.description)
            
        }
        .padding()
        .foregroundColor(.pipBoyText)
        .overlay {
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isShown.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.pipBoyText)
                            .background(Color.pipBoyBackground)
                            .cornerRadius(20)
                            .overlay {
                                Circle()
                                    .strokeBorder(lineWidth: 2)
                                    .foregroundColor(.pipBoyText)
                            }
                    }
                    .frame(width: 40, height: 40)
                    .offset(x: 10, y: -10)
                    
                }
                
                Spacer()
                
            }
            
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.pipBoyBackground)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(lineWidth: 2)
                        .foregroundColor(.pipBoyText)
                }
        }
        .padding()
        .offset(y: isShown ? 0 : UIScreen.main.bounds.height * 1.5)
        .animation(.easeInOut, value: isShown)
        
    }
}

struct AttributeDetails_Previews: PreviewProvider {
    static var previews: some View {
        AttributeDetails(
            attribute: .constant(Attribute()),
            isShown: .constant(true))
    }
}
