//
//  UIViewExtension.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 8.12.2023.
//

import Foundation
import UIKit
import Lottie

extension UIView {
    func blurEffects(lottie: LottieAnimationView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        lottie.animation = LottieAnimation.named("save")
        self.addSubview(lottie)
        lottie.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        lottie.play()
    }
}
