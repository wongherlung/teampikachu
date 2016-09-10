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
        let videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480,
                                              cameraPosition: .Back)
        videoCamera.outputImageOrientation = UIInterfaceOrientation.Portrait
        
        videoCamera.startCameraCapture()
    }

}

