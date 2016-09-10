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
    
    @IBOutlet weak var scoreLabel: UILabel!
    private let videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480,
                                                  cameraPosition: .Back)
    private let videoView = GPUImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
    private var motionDetectionCount: Int = 0
    private var startFrameTime: CGFloat = 0
    
    private let motionIntensityThreshold: CGFloat = 0.075
    private let minimumCount: Int = 5
    private let minimumDuration: CGFloat = 1.5
    private var totalScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initCamera()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(sender: AnyObject) {
        totalScore = 0
    }
 
    @IBAction func stopButton(sender: AnyObject) {
        
    }
   
    private func initCamera() {
        videoCamera.outputImageOrientation = UIInterfaceOrientation.Portrait
        
        let filter = GPUImageMotionDetector()
        filter.motionDetectionBlock = { (motionCentriod: CGPoint, motionIntensity: CGFloat, frameTime: CMTime) in
            
            // Intensity must be of a certain threshold
            if motionIntensity >= self.motionIntensityThreshold {
                
                // Keep track of the time of the first detection
                if self.motionDetectionCount == 0 {
                    self.startFrameTime = CGFloat(frameTime.value) / 1000000000.0
                }
                
                let newFrameTime = CGFloat(frameTime.value) / 1000000000.0
                self.motionDetectionCount += 1
                
                // There must be 5 or more detections and there has to be a sustained
                // duration for it to be considered an event.
                if self.motionDetectionCount > self.minimumCount &&
                    newFrameTime - self.startFrameTime >= self.minimumDuration {
                    
                    // Insert code to make API call
                    self.throwEventDetected()
                    
                    // Reset tracking parameters
                    self.startFrameTime = newFrameTime
                    self.motionDetectionCount = 0
                }
                
            }
        }
        
        videoView.hidden = true
        view.addSubview(videoView)
        
        videoCamera.addTarget(filter)
        filter.addTarget(videoView)
        
        videoCamera.startCameraCapture()
    }
    
    private func throwEventDetected() {
        totalScore += 1
        dispatch_async(dispatch_get_main_queue(), {
            self.scoreLabel.text = String(self.totalScore)
        })
    }
}

