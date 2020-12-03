//
//  ViewModel.swift
//  swiftui-drag-and-drop-api
//
//  Created by Huy D. on 12/2/20.
//

import SwiftUI
import MobileCoreServices

class ImageViewModel: ObservableObject, DropDelegate {
    
    @Published var allImages = [ImageModel]()
    @Published var selectedImages = [ImageModel]()
    
    init() {
        self.fetchImageList()
    }
    
    private func fetchImageList() {
        for n in 1...30 {
            let image = ImageModel(imageName: "\(n)")
            allImages.append(image)
        }
    }
    
    public func removeImage(by imageName: String) {
        self.selectedImages.removeAll { (check) -> Bool in
            return check.imageName == imageName
        }
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            
            guard provider.canLoadObject(ofClass: URL.self) else {
                print("Can't Load Object")
                continue
            }
            
            let _ = provider.loadObject(ofClass: URL.self) { (url, error) in

                guard let url = url?.absoluteString else {
                    print("No Load Object URL")
                    return
                }
                
                let status = self.selectedImages.contains { (check) -> Bool in
                    return check.imageName == url
                }
                
                if !status {
                    DispatchQueue.main.async {
                        withAnimation(.easeOut) {
                            let droppedImage = ImageModel(imageName: url)
                            self.selectedImages.append(droppedImage)
                        }
                    }
                }
                
            }
            
        }
        
        return true
    }
    
}
