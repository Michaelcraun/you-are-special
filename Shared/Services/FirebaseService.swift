//
//  FirebaseService.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/14/21.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

struct Firebase {
    static let service = Firebase()
    
    private var firestore: Firestore { Firestore.firestore() }
    var attributeCollection: CollectionReference { firestore.collection("attribute") }
    var buildCollection: CollectionReference { firestore.collection("build") }
    var perkCollection: CollectionReference { firestore.collection("perk") }
    var versionCollection: CollectionReference { firestore.collection("version") }
    
    private var storage: StorageReference { Storage.storage().reference() }
    var perkStorage: StorageReference { storage.child("perk") }
    var versionStorage: StorageReference { storage.child("version") }
    
    func authenticate() async -> Result<User,Error> {
        do {
            let result = try await Auth.auth().signInAnonymously()
            return .success(result.user)
        } catch {
            return .failure(error)
        }
    }
    
    func versionWith(id: String) async -> Result<Version,Error> {
        do {
            let result = try await versionCollection.document(id).getDocument()
            guard let version = try result.data(as: Version.self) else { return .failure(FirebaseError.unableToDecode)}
            return .success(version)
        } catch {
            return .failure(error)
        }
    }
}

enum FirebaseError: Error {
    case unableToDecode
}
