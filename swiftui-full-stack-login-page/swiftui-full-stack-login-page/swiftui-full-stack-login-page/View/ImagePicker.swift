//
//  ImagePicker.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/21/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    
    @Binding var showPicker: Bool
    @Binding var imageData: Data
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.showPicker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let imgData = info[.originalImage] as? UIImage,
            let jpegData = imgData.jpegData(compressionQuality: 0.5) else {
                return
            }
            parent.imageData = jpegData
            self.parent.showPicker.toggle()
        }
        
    }
    
}
