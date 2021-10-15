//
//  MainViewModel.swift
//  you-are-special
//
//  Created by Michael Craun on 10/14/21.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var version: Version = Fallout4.game.version
    @Published var versions: [Version] = []
    @Published var perkChart: [Version.AttributeList] = Fallout4.game.version.perkChart()
    
    private func addNew(version: Version) {
        DataService.shared.set(value: version.id, for: .version)
        
        self.perkChart = version.perkChart()
        self.version = version
        if !self.versions.contains(version) {
            self.versions.append(version)
        }
    }
    
    private func fetchPerksFor(version: Version) async {
        let result = await Firebase.service.perksForVersionWith(id: version.id)
        switch result {
        case .failure(let error):
            print(#function, error.localizedDescription)
            // TODO: Log error
        case .success(let perks):
            self.version.perks = perks
        }
    }
    
    private func fetchPreviousOrDefaultVersion() async -> Version? {
        let version = DataService.shared.getValueFor(key: .version) ?? self.version.id
        let versionResult = await Firebase.service.versionWith(id: version)
        switch versionResult {
        case .failure(let error):
            print(#function, error.localizedDescription)
            // TODO: Log error
        case .success(let version):
            return version
        }
        return nil
    }
    
    func setup() async {
        let authResult = await Firebase.service.authenticate()
        switch authResult {
        case .failure(let error):
            print(#function, error.localizedDescription)
            // TODO: Log error
        case.success:
            if let version = await fetchPreviousOrDefaultVersion() {
                self.addNew(version: version)
                await self.fetchPerksFor(version: version)
            }
        }
    }
}
