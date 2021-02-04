//
//  CameraPreview.swift
//  TestProjectWithCamera
//
//  Created by Oleg Granchenko on 03.02.2021.
//

import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera : CameraViewModel
    
    func makeUIView(context: Context) -> UIView {
     
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.bounds
        camera.preview.videoGravity = .resizeAspectFill
//        camera.preview.connection?.videoOrientation = transformOrientation(orientation: UIInterfaceOrientation(rawValue: UIApplication.shared.statusBarOrientation.rawValue)!)
        
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        
        return view
    }
    
//    func transformOrientation(orientation: UIInterfaceOrientation) -> AVCaptureVideoOrientation {
//        switch orientation {
//        case .landscapeLeft:
//            return .landscapeLeft
//        case .landscapeRight:
//            return .landscapeRight
//        case .portraitUpsideDown:
//            return .portraitUpsideDown
//        default:
//            return .portrait
//        }
//    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}
