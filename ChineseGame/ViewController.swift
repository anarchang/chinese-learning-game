//
//  ViewController.swift
//  ChineseGame
//
//  Created by Bor-Yuh Evan Chang on 7/31/17.
//  Copyright © 2017 Chang Ramirez. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation
import SwiftGifOrigin

class ViewController: UIViewController {

    private var sound: AVAudioPlayer = AVAudioPlayer()
    private var subview: UIView = UIView()
    private var gifView = UIImageView()
    
    override func viewDidLoad() {
        self.view.addSubview(subview)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let button = UIButton()
        button.setTitle("張", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 33
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(self.btnclicked), for: .touchUpInside)
        subview.addSubview(button)

        subview.snp.makeConstraints { (make) in
            make.size.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        button.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.center.equalTo(subview)
        }
        
        gifView = UIImageView(image: UIImage.gif(name: "張"))
        subview.addSubview(gifView)
        gifView.snp.makeConstraints { (make) in
            make.size.equalTo(100)
            make.bottom.equalTo(subview).offset(20)
        }
        
    }
    
    func btnclicked(sender: UIButton!)
    {
        print("button clicked")
        subview.removeFromSuperview()
        let audioFilePath = Bundle.main.path(forResource: "1-08 第二單元：拍拍手", ofType: "m4a")
        if (audioFilePath != nil) {
            let path = audioFilePath!
            let url = URL(fileURLWithPath: path)
            
            try! sound = AVAudioPlayer(contentsOf: url)
            sound.play()
            print("play")
            
        } else {
            debugPrint ("audioFilePath nil")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

