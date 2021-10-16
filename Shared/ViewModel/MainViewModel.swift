//
//  MainViewModel.swift
//  you-are-special
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class MainViewModel: ObservableObject {
    // MARK: - Version
    @Published var version: Version = Fallout4.game.version
    @Published var versions: [Version] = []
    @Published var perkChart: [Version.AttributeList] = Fallout4.game.version.perkChart()
    
    // MARK: - Presentation
    @Published var isPickingDocumentForImport = false
    @Published var isPresentingMenu = false
    
    func importFileAt(location: URL?) {
        do {
            guard let location = location else { return }
            let version = try Importer.service.readFileAt(location: location)
            try Importer.service.validate(version: version)
            try Importer.service.uploadVersionAt(location: location)
        } catch {
            // TODO: Better error handling
            guard let error = error as? ImporterError else {
                print("MainViewModel", #function, "unkown error occurred: [\(error.localizedDescription)]")
                return
            }
            print("MainViewModel", #function, error.localizedDescription)
        }
    }
}
