//
//  CameraView.swift
//  SnapchatMenu
//
//  Created by marquis on 16/2/29.
//  Copyright © 2016年 marquis. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var captureSession: AVCaptureSession?
    var stillImageOutPut: AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var didTakePhoto = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        process()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        didPressTakeAnother()
    }
    
}

// MARK: - init process
extension CameraView{
    func process(){
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        
        do{
            input = try AVCaptureDeviceInput(device: backCamera)
        }catch let _error as NSError{
            error = _error
            input = nil
        }
        if error == nil && captureSession?.canAddInput(input) != nil {
            captureSession?.addInput(input)
            
            stillImageOutPut = AVCaptureStillImageOutput()
            stillImageOutPut?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            
            if captureSession?.canAddOutput(stillImageOutPut) != nil{
                captureSession?.addOutput(stillImageOutPut)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                captureSession?.startRunning()
            }
        }
    }
}

// MARK: - press take
extension CameraView{
    func didPressTakePhoto(){
        if let videoConnection = stillImageOutPut?.connectionWithMediaType(AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutPut?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: { (sampleBuffer, error) -> Void in
                if sampleBuffer != nil {
                    
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.imageView.image = image
                    self.imageView.hidden = false
                }
            })
        }
    }
    
    func didPressTakeAnother(){
        if didTakePhoto == true{
            imageView.hidden = true
            didTakePhoto = false
        }else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
    }
}


