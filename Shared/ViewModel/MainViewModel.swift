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
    @Published var perkChart: Version.PerkChart = Fallout4.game.version.perkChart()
    
    // MARK: - Presentation
    @Published var isPickingDocumentForImport = false
    @Published var isPresentingMenu = false
    
    private func addFetched(version: Version) {
        DispatchQueue.main.async {
            self.version = version
            self.perkChart = version.perkChart()
            
            if !self.versions.contains(version) {
                self.versions.append(version)
            }
        }
    }
    
    func importFileAt(location: URL?) {
        do {
            guard let location = location else { return }
            let version = try Importer.service.readFileAt(location: location)
            try Importer.service.validate(version: version)
            try Importer.service.uploadVersionAt(location: location)
        } catch {
            // TODO: Better error handling
            guard let error = error as? ImporterError else {
                print("MainViewModel", #function, "unkown error occurred [\(error.localizedDescription)]")
                return
            }
            print("MainViewModel", #function, error.localizedDescription)
        }
    }
    
    func setup() async {
        let versionID = DataService.shared.getValueFor(key: .version) ?? "fo4"
        let result = await Firebase.service.versionWith(id: versionID)
        switch result {
        case .failure(let error):
            print("MainViewModel", #function, error.localizedDescription)
            // TODO: Better error handling
        case .success(let version):
            addFetched(version: version)
        }
    }
}
