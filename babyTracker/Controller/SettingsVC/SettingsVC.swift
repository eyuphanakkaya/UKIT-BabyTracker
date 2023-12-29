//
//  SettingsVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 26.11.2023.
//

import UIKit
import SnapKit

class SettingsVC: UIViewController {

    // MARK: - components
    let backButton = UIButton()
    let premiumButton = UIButton()
    let rateUsButton = CustomSettingsButtons(image:"rate", label: "Rate Us")
    let termsOfUseButton = CustomSettingsButtons(image: "terms", label: "Terms of Use")
    let privacyButton = CustomSettingsButtons(image: "Privacy", label: "Privacy Policy")
    let contactButton = CustomSettingsButtons(image: "contact", label: "Contact Us")
    let restoreButton = CustomSettingsButtons(image:  "Terms of Use", label: "Restore Purchase")
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        addTargetActions()
        // Do any additional setup after loading the view.
    }
    // MARK: - add target action
    func addTargetActions() {
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    @objc func backButtonAction() {
        dismiss(animated: true)
    }
    // MARK: - constraints style
    func constraintStyle() {
        view.backgroundColor = .systemBackground

        /// MARK :  - title style
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        titleLabel.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
        }
        /// MARK :  - back button
        backButton.setImage(UIImage(named: "Vector"), for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalTo(titleLabel.snp.leading).inset(-120)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        /// MARK :  - premium button
        premiumButton.setImage(.premium, for: .normal)
        view.addSubview(premiumButton)
        premiumButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(80)
        }
        /// MARK:  - rate us style
        rateUsButton.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        rateUsButton.layer.cornerRadius = 25
        view.addSubview(rateUsButton)
        rateUsButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(130)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(60)
        }
        /// terms of use button style
        termsOfUseButton.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        termsOfUseButton.layer.cornerRadius = 25
        view.addSubview(termsOfUseButton)
        termsOfUseButton.snp.makeConstraints { make in
            make.top.equalTo(rateUsButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(60)
        }
        /// privacy button style
        privacyButton.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        privacyButton.layer.cornerRadius = 25
        view.addSubview(privacyButton)
        privacyButton.snp.makeConstraints { make in
            make.top.equalTo(termsOfUseButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(60)
        }
        /// contact button style
        contactButton.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        contactButton.layer.cornerRadius = 25
        view.addSubview(contactButton)
        contactButton.snp.makeConstraints { make in
            make.top.equalTo(privacyButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(28)
            make.height.equalTo(60)
        }
        /// restore button style
        restoreButton.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        restoreButton.layer.cornerRadius = 25
        view.addSubview(restoreButton)
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(contactButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.right.equalToSuperview().inset(28)
            make.height.equalTo(60)
        }
        /// check premium
        if UserDefaults.standard.bool(forKey: "PayWall") == true {
            premiumButton.isHidden = true
            rateUsButton.snp.remakeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(30)
                make.centerX.equalToSuperview()
                make.left.right.equalToSuperview().inset(28)
                make.height.equalTo(60)
            }
        }
    }
}
