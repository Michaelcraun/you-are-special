//
//  FirebaseService.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Firebase
import FirebaseFirestoreSwift
import FirebaseStorageSwift
import Foundation

struct Firebase {
    static let service = Firebase()
    
    private var maxFileSize: Int64 { 5 * 1024 * 1024}
    
    private var firestore: Firestore { Firestore.firestore() }
    var attributeCollection: CollectionReference { firestore.collection("attribute") }
    var buildCollection: CollectionReference { firestore.collection("build") }
    var perkCollection: CollectionReference { firestore.collection("perk") }
    var versionCollection: CollectionReference { firestore.collection("version") }
    
    private var storage: StorageReference { Storage.storage().reference() }
    var imageStorage: StorageReference { storage.child("image") }
    var versionStorage: StorageReference { storage.child("version") }
    
    func authenticate() async -> Result<User,Error> {
        do {
            let result = try await Auth.auth().signInAnonymously()
            return .success(result.user)
        } catch {
            return .failure(error)
        }
    }
    
    func imageWith(path: String) async -> Result<Data,Error> {
        let result = await withCheckedContinuation({ continuation in
            self.imageStorage.child("\(path).png").getData(maxSize: maxFileSize) { result in
                continuation.resume(returning: result)
            }
        })
        
        switch result {
        case .failure(let error):
            print("Firebase", #function, error.localizedDescription)
            return .failure(error)
        case .success(let data):
            return .success(data)
        }
    }
    
    func versionWith(id: String) async -> Result<Version,Error> {
        do {
            let result = await withCheckedContinuation({ continuation in
                self.versionStorage.child("\(id).json").getData(maxSize: maxFileSize) { result in
                    continuation.resume(returning: result)
                }
            })
            
            switch result {
            case .failure(let error):
                return .failure(error)
            case .success(let data):
                let version = try JSONDecoder().decode(Version.self, from: data)
                return .success(version)
            }
        } catch {
            return .failure(error)
        }
    }
}

enum FirebaseError: Error {
    case unableToDecode
}
