//
//  QRCodeViewController.swift
//  Junking
//
//  Created by Wong Her Laang on 11/9/16.
//  Copyright © 2016 nus.hackfest.2016.teampikachu. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
    
    var score: Int = 0
    private var qrcodeImage: CIImage! = CIImage()
    @IBOutlet weak var QRImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(score)
        initQRCodeView()
    }
    
    private func initQRCodeView() {
        let data = "http://home.herlaang.com:5000".dataUsingEncoding(NSISOLatin1StringEncoding,
                                                                     allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("H", forKey: "inputCorrectionLevel")
        qrcodeImage = filter!.outputImage
        
        QRImageView.image = UIImage(CIImage: qrcodeImage)
    }
    
}
