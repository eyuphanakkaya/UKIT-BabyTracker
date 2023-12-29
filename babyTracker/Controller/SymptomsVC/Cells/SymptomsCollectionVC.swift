//
//  SymptomsCollectionVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 4.12.2023.
//

import UIKit
import SnapKit

class SymptomsCollectionVC: UICollectionViewCell {
    static let identifier = "cell"
    let imageView = UIImageView()
    var symptom: Symptoms!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}
