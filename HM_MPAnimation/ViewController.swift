//
//  ViewController.swift
//  HM_MPAnimation
//
//  Created by 胡苗 on 2019/7/10.
//  Copyright © 2019 胡苗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var animationLayer:HMAnimationLayer = {
        let layer = HMAnimationLayer.init(frame: CGRect(x: 100, y: 100, width: 2, height: 15))
        return layer
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationLayer);
        // Do any additional setup after loading the view.
    }


}

