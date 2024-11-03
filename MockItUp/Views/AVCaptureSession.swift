//
//  AVCaptureSession.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import AVFoundation

enum VideoError: Error, LocalizedError {
    case device(reason: DeviceErrorReason)

    enum DeviceErrorReason {
        case unableToSetInput
        case unableToSetOutput
    }

    var errorDescription: String? {
        switch self {
        case .device(let reason):
            switch reason {
            case .unableToSetInput:
                return "Unable to set video input device."
            case .unableToSetOutput:
                return "Unable to set video output device."
            }
        }
    }
}

extension AVCaptureSession {
    var movieFileOutput: AVCaptureMovieFileOutput? {
        let output = self.outputs.first as? AVCaptureMovieFileOutput
        
        return output
    }
    
    func addMovieInput() throws -> Self {
        // Add video input
        guard let videoDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            throw VideoError.device(reason: .unableToSetInput)
        }
        
        let videoInput = try AVCaptureDeviceInput(device: videoDevice)
        guard self.canAddInput(videoInput) else {
            throw VideoError.device(reason: .unableToSetInput)
        }
        
        self.addInput(videoInput)
        
        return self
    }
    
    func addMovieFileOutput() throws -> Self {
        guard self.movieFileOutput == nil else {
            // return itself if output is already set
            return self
        }
        
        let fileOutput = AVCaptureMovieFileOutput()
        guard self.canAddOutput(fileOutput) else {
            throw VideoError.device(reason: .unableToSetOutput)
        }
        
        self.addOutput(fileOutput)
        
        return self
    }
}
