//
//  ViewModel.swift
//  swiftui-drag-and-drop-api
//
//  Created by Huy D. on 12/2/20.
//

import Foundation

class ImageViewModel: ObservableObject {
    
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
    
}
