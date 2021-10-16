//
//  DocumentPicker.swift
//  you-are-special
//
//  Created by Michael Craun on 10/15/21.
//

import SwiftUI

struct DocumentPicker: UIViewControllerRepresentable {
    let onSelect: ((URL?) -> Void)?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.json])
        picker.delegate = context.coordinator
        picker.allowsMultipleSelection = false
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {  }
    
    func makeCoordinator() -> DocumentPickerCoordinator {
        DocumentPickerCoordinator(onSelect: onSelect)
    }
    
    class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {
        let onSelect: ((URL?) -> Void)?
        
        init(onSelect: ((URL?) -> Void)?) {
            self.onSelect = onSelect
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            onSelect?(url)
        }
    }
}

struct DocumentPicker_Previews: PreviewProvider {
    static var previews: some View {
        DocumentPicker { location in
            
        }
    }
}
