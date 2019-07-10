//
//  HMAnimationLayer.swift
//  HM_MPAnimation
//
//  Created by 胡苗 on 2019/7/10.
//  Copyright © 2019 胡苗. All rights reserved.
//

import UIKit

let INSTANCE_COLOR = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)

class HMAnimationLayer: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayer() {
    
        // 创建
        let layer:CALayer = CALayer()
        layer.frame = self.bounds
        layer.backgroundColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.add(scaleYAnimation(), forKey: "scaleAnimation")
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = self.bounds
        
        // 设置复制层里面包含子层的个数
        replicatorLayer.instanceCount = 8
        
        // 设置子层相对于之前一个层的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(5, 0, 0)
        
        // 设置子层相对于前一层的延迟时间
        replicatorLayer.instanceDelay = 0.2
        
        // 设置层的颜色
        //（前提是要设置层的背景颜色，如果没有设置背景颜色，默认是透明，在设置这个属性不会有效果）。
        replicatorLayer.instanceColor = INSTANCE_COLOR.cgColor
        
        // 需要把子层加入到复制层中，复制层按照前面设置的参数自动复制
        replicatorLayer.addSublayer(layer)
        
        // 将复制层加入view的层里面进行显示
        self.layer.addSublayer(replicatorLayer)
        
    }
   

}

extension HMAnimationLayer {
    fileprivate func scaleYAnimation() -> CABasicAnimation {
        let anim = CABasicAnimation.init(keyPath: "transform.scale.y")
        anim.toValue = 0.1
        anim.duration = 0.4
        anim.autoreverses = true
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = false
    
        return anim
    }
}
