//
//  DetailDismisser.swift
//  you-are-special
//
//  Created by Michael Craun on 10/18/21.
//

import SwiftUI

struct DetailDismisser: View {
    @Binding var isShown: Bool
    
    var body: some View {
        
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
}

struct DetailDismisser_Previews: PreviewProvider {
    static var previews: some View {
        DetailDismisser(isShown: .constant(true))
    }
}
