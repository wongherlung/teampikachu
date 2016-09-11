//
//  QRCodeViewController.swift
//  Junking
//
//  Created by Wong Her Laang on 11/9/16.
//  Copyright © 2016 nus.hackfest.2016.teampikachu. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {
    
    var score: Int = 0
    var userName: String = ""
    private var qrcodeImage: CIImage! = CIImage()
    @IBOutlet weak var QRImageView: UIImageView!
    private var jackpotPlayer: AVAudioPlayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initQRCodeView()
        playJackpotSound()
    }
    
    private func initQRCodeView() {
        let info = "http://home.herlaang.com:5000/redeem?name=" + userName + "&recycled_product=" + String(score)
        let data = info.dataUsingEncoding(NSISOLatin1StringEncoding,
                                          allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("H", forKey: "inputCorrectionLevel")
        qrcodeImage = filter!.outputImage
        
        QRImageView.image = UIImage(CIImage: qrcodeImage)
    }
    
    private func playJackpotSound() {
        let coinSoundFile = NSURL(fileURLWithPath: NSBundle.mainBundle()
            .pathForResource("slot", ofType: "wav")!)
        
        jackpotPlayer = try? AVAudioPlayer(contentsOfURL: coinSoundFile)
        
        jackpotPlayer?.numberOfLoops = 0
        jackpotPlayer?.prepareToPlay()
        jackpotPlayer?.play()
    }
    
}
