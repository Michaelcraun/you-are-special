//
//  ContentView.swift
//  Shared
//
//  Created by Michael Craun on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack(spacing: 0) {
                    
                    PerkChart(chart: viewModel.attributeModels, selectedAttribute: $viewModel.selectedAttribute)
                    
                    Spacer()
                    
                }
                .padding()
                
                ForEach(viewModel.attributeModels, id: \.attribute.id) { model in
                    
                    AttributeDetails(
                        viewModel: model,
                        isShown: .init(
                            get: {
                                viewModel.selectedAttribute == model.attribute
                            }, set: { newValue in
                                if !newValue {
                                    viewModel.selectedAttribute = nil
                                }
                            }))
                    
                }
                
            }
            .sheet(isPresented: $viewModel.isPickingDocumentForImport) {
                DocumentPicker { location in
                    viewModel.importFileAt(location: location)
                }
            }
            .navigationBarItems(
                leading: HStack {
                    
                },
                trailing: HStack {
                    #if DEBUG
                    Button {
                        viewModel.isPickingDocumentForImport.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                    }
                    #endif
                })
            .navigationTitle("YOU ARE...")
            .task {
                await viewModel.setup()
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
