//
//  ImageDemoView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 20/10/24.
//

import SwiftUI

struct ImageDemoView: View {
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(height: 100)
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 143, height: 143)
                                        .cornerRadius(80)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 80))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 80)
                                .stroke(Color.black, lineWidth: 3)
                            )
                        }
                    }
                    (image == nil) ? Text("Click to update image") : Text("")
                }
                
                VStack(spacing: 15) {
                    VStack(spacing: 5) {
                        Text("First name")
                            .bold()
                            .font(.title)
                        Text("Last name")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }.padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationTitle("My Account")
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
                .ignoresSafeArea()
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
#Preview {
    ImageDemoView()
}
