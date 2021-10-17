//
//  FirebaseImage.swift
//  you-are-special (iOS)
//
//  Created by Michael Craun on 10/17/21.
//

import SwiftUI

struct FirebaseImage: View {
    @State private var images: [UIImage?] = []
    @State private var currentImage: UIImage?
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    let paths: [String]
    
    var body: some View {
        
        if let currentImage = currentImage {
            Image(uiImage: currentImage)
                .resizable()
                .onReceive(timer) { _ in
                    if let oldImage = self.images.removeFirst() {
                        self.images.append(oldImage)
                        self.currentImage = self.images[0]
                    }
                }
        } else {
            ProgressView()
                .task {
                    // Get image data from Firebase and append to local images
                    for path in paths {
                        if let data = try? await Firebase.service.imageWith(path: path).get() {
                            let image = UIImage(data: data)
                            self.images.append(image)
                            
                            if self.currentImage == nil {
                                self.currentImage = image
                            }
                        }
                    }
                }
        }
        
    }
}

struct FirebaseImage_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseImage(paths: ["fo4/luck"])
    }
}
