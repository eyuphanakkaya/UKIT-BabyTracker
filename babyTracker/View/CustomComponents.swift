//
//  CustomComponents.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 26.11.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomSettingsButtons : UIView {
    var image = UIImageView()
    var label = UILabel()
    var button = UIButton()
    init(image: String, label: String) {
        super.init(frame: .zero)
        configureUI(title: image,labels: label)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(title: String, labels: String) {
        addSubview(image)
        image.image = UIImage(named: title)
        image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(11)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.text = labels
        addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(image.snp.right).offset(4)
        }
        button.setImage(UIImage(named: "next"), for: .normal)
        addSubview(button)
        button.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(13)
            make.centerY.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
    }
}
class CustomButton : UIButton {
    init(title: String) {
        super.init(frame: .zero)
        configureUI(titles: title)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(titles: String) {
        let title = titles
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backgroundColor = .purple
        layer.cornerRadius = 31

    }
}
