//
//  AuthorizationChecker.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import AVFoundation

struct AuthorizationChecker {
    static func checkCaptureAuthorizationStatus() async -> Status {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .permitted
            
        case .notDetermined:
            let isPermissionGranted = await AVCaptureDevice.requestAccess(for: .video)
            if isPermissionGranted {
                return .permitted
            } else {
                fallthrough
            }
            
        case .denied:
            fallthrough
            
        case .restricted:
            fallthrough
            
        @unknown default:
            return .notPermitted
        }
    }
}

extension AuthorizationChecker {
    enum Status {
        case permitted
        case notPermitted
    }
}
