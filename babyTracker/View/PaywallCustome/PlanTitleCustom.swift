//
//  PlanTitleCustom.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 16.12.2023.
//

import Foundation
import UIKit


/// custumize plan label
class CustomPlanLabel : UILabel {
    init(title: String) {
        super.init(frame: .zero)
        configureUI(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(title: String) {
        text = title
        font = UIFont.boldSystemFont(ofSize: 16)
        textColor = .black
        sizeToFit()
    }
    
}

class PlanTitleCustomView: UIView {
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - constraint style
    func configureUI() {
        /// image one style
        let imageOne = UIImageView()
        imageOne.image = .paywallimage
        addSubview(imageOne)
        imageOne.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// image two style
        let imageTwo = UIImageView()
        imageTwo.image = .paywallimage
        addSubview(imageTwo)
        imageTwo.snp.makeConstraints { make in
            make.top.equalTo(imageOne.snp.bottom)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// image therd style
        let imageTherd = UIImageView()
        imageTherd.image = .paywallimage
        addSubview(imageTherd)
        imageTherd.snp.makeConstraints { make in
            make.top.equalTo(imageTwo.snp.bottom)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// title one style
        let titleOne = CustomPlanLabel(title: "Share the care")
        addSubview(titleOne)
        titleOne.snp.makeConstraints { make in
            make.centerY.equalTo(imageOne.snp.centerY)
            make.left.equalTo(imageOne.snp.right)

        }
        /// title two style
        let titleTwo = CustomPlanLabel(title: "All-in-one baby tracke")
        addSubview(titleTwo)
        titleTwo.snp.makeConstraints { make in
            make.centerY.equalTo(imageTwo.snp.centerY)
            make.left.equalTo(imageTwo.snp.right)

        }
        /// title third style
        let titleThird = CustomPlanLabel(title: "Watch your babys growth")
        addSubview(titleThird)
        titleThird.snp.makeConstraints { make in
            make.centerY.equalTo(imageTherd.snp.centerY)
            make.left.equalTo(imageTherd.snp.right)
        }
        
    }
}
