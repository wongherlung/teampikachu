//
//  ViewController.swift
//  Junking
//
//  Created by Wong Her Laang on 10/9/16.
//  Copyright © 2016 nus.hackfest.2016.teampikachu. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    private let videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480,
                                                  cameraPosition: .Back)
    private let videoView = GPUImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))

    override func viewDidLoad() {
        super.viewDidLoad()
        initCamera()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initCamera() {
        videoCamera.outputImageOrientation = UIInterfaceOrientation.Portrait
        
        let filter = GPUImageFilter()
        
        view.addSubview(videoView)
        
        videoCamera.addTarget(filter)
        filter.addTarget(videoView)
        
        videoCamera.startCameraCapture()
    }

}

