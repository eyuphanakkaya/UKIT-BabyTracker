//
//  PaywallVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 15.12.2023.
//

import UIKit

class PaywallVC: UIViewController {

    // MARK: - components
    let backButton = UIButton()
    let startButton = CustomButton(title: "Start")
    let buyPremium = UIButton()
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        buttonActions()
    }
    // MARK: - button actions
    func buttonActions() {
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        buyPremium.addTarget(self, action: #selector(buyPremiumClicked), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
        UserDefaults.standard.set(Globals.shared.buyPremiums, forKey: "PayWall")
    }
    @objc func buyPremiumClicked() {
        Globals.shared.buyPremiums.toggle()
        if Globals.shared.buyPremiums {
            buyPremium.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            buyPremium.layer.borderWidth = 2
        } else {
            buyPremium.layer.borderColor = .none
            buyPremium.layer.borderWidth = 0
        }
    }
    @objc func startButtonClicked() {
        if Globals.shared.buyPremiums {
            let vc = HomeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            UserDefaults.standard.set(Globals.shared.buyPremiums, forKey: "PayWall")
        } else {
            Alerts.alertAction(title: "Error", message: "Please select pay options", vc: self)
        }
    }
    // MARK: - constraints styke
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        
        backButton.setImage(.back, for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-23)
            make.top.equalToSuperview().offset(50)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// button style
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-65)
            make.left.right.equalToSuperview().inset(26)
            make.height.equalTo(64)
        }
        /// paywal button style
        buyPremium.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        buyPremium.layer.cornerRadius = 25
        view.addSubview(buyPremium)
        buyPremium.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-64)
            make.left.right.equalToSuperview().inset(27)
            make.height.equalTo(82)
        }
        /// annual label
        let annualLabel = UILabel()
        annualLabel.text = "Annual"
        annualLabel.font = UIFont.boldSystemFont(ofSize: 18)
        annualLabel.sizeToFit()
        buyPremium.addSubview(annualLabel)
        annualLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.centerY.equalToSuperview()
        }
        /// price page label
        let priceLabel = UILabel()
        priceLabel.text = "$30"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        priceLabel.sizeToFit()
        buyPremium.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-22)
            make.centerY.equalToSuperview()
        }
        ///  imageview style
        let imageViews = UIImageView()
        imageViews.image  = .paywallimage2
        view.addSubview(imageViews)
        imageViews.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(100)
            make.height.equalTo(view.frame.height - 650)
        }
        /// title label
        let titleLabel = UILabel()
        titleLabel.text = "Get Premium!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        titleLabel.textColor = UIColor(red: 0.275, green: 0.147, blue: 0.767, alpha: 1)
        titleLabel.sizeToFit()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageViews.snp.bottom).offset(44)
            make.centerX.equalToSuperview()
        }
        /// pay wall price title
        let planTitle = PlanTitleCustomView()
        view.addSubview(planTitle)
        planTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(85)
            make.height.equalTo(view.frame.height - 850)
        }
        

        
    }
    


}
