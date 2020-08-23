//
//  MultilineTextField.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/22/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return MultilineTextField.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.text = "About You !!!"
        view.textColor = .gray
        view.font = .systemFont(ofSize: 18)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultilineTextField
        
        init(parent: MultilineTextField) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if parent.text == "" {
                parent.text = "About You !!!"
            }
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            parent.text = ""
        }
        
    }
    
}


