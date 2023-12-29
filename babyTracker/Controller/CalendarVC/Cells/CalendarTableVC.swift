//
//  CalenderTableVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 8.12.2023.
//

import UIKit

class CalendarTableVC: UITableViewCell {

    // MARK: - components
    let titleLabel = UILabel()
    let timeLabel = UILabel()
    let customView = UIView()
    let imageViews = UIImageView()
    let note = UILabel()
    static let identifier = "tableCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureUI()
    }
    // MARK: - configure style
    func configureUI() {

        /// content view style
        contentView.layer.cornerRadius = 25
        contentView.backgroundColor = .clear
        customView.layer.cornerRadius = 25
        customView.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview().inset(8)
        }
        /// image views style
        customView.addSubview(imageViews)
        imageViews.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(3)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// title  style
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor(red: 0.275, green: 0.147, blue: 0.767, alpha: 1)
        customView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageViews.snp.right).offset(5)
        }
        /// time style
        timeLabel.sizeToFit()
        timeLabel.textColor = .black
        timeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        customView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-23)
            
        }

        
        
        
    }
}
