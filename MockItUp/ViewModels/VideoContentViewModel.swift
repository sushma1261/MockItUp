//
//  VideoContentViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import Foundation
import AVFoundation

//class VideoContentViewModel: ObservableObject {
//    let session: AVCaptureSession
//    
//    init() {
//        self.session = AVCaptureSession()
//        
//        Task(priority: .background) {
//            switch await AuthorizationChecker.checkCaptureAuthorizationStatus() {
//            case .permitted:
//                try session
//                    .addMovieInput()
//                    .addMovieFileOutput()
//                    .startRunning()
//                
//            case .notPermitted:
//                break
//            }
//        }
//    }
//}


class VideoContentViewModel: NSObject, ObservableObject {
    let session: AVCaptureSession
    @Published var preview: Preview?
    
    override init() {
        self.session = AVCaptureSession()
        
        super.init()
        
        Task(priority: .background) {
            switch await AuthorizationChecker.checkCaptureAuthorizationStatus() {
            case .permitted:
                try session
                    .addMovieInput()
                    .addMovieFileOutput()
                    .startRunning()
                
                DispatchQueue.main.async {
                    self.preview = Preview(with: self.session, gravity: .resizeAspectFill)
                }
                
            case .notPermitted:
                break
            }
        }
    }
        
//    ...
}
