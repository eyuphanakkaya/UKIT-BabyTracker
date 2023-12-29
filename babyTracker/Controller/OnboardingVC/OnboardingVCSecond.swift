//
//  OnboardingVCSecond.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 26.11.2023.
//

import UIKit

class OnboardingVCSecond: UIViewController {

    // MARK: - components
    let nextButton = UIButton()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsStyle()
        addTargetActions()
        UserDefaults.standard.set(false, forKey: "Value")
        // Do any additional setup after loading the view.
    }
    // MARK: - target actions
    func addTargetActions() {
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    // MARK: - button actions
    @objc func nextButtonClicked() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.heroNavigationAnimationType = .slide(direction: .up)
        navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - constraint style
    func constraintsStyle() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        // MARK: - image view style
        let imageView = UIImageView()
        imageView.image = UIImage(named: "onboardingSecond")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.frame.height - 300)
        }
        let customView = UIView()
        customView.backgroundColor = .systemBackground
        customView.layer.cornerRadius = 20
        view.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.frame.height - 400)
        }
        // MARK: - title label style
        let titleLabel = UILabel()
        titleLabel.text = "Stay Connected with Caregivers"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 31)
        titleLabel.textColor = .black
        customView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.right.left.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(88)
        }
        // MARK: - descriptions label style
        let descriptionsLabel = UILabel()
        descriptionsLabel.text = "Share access to your baby's tracker with family members, babysitters, or healthcare providers "
        descriptionsLabel.numberOfLines = 0
        descriptionsLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionsLabel.textColor = .black
        customView.addSubview(descriptionsLabel)
        descriptionsLabel.snp.makeConstraints { make in
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.bottom.equalTo(titleLabel.snp.bottom).offset(100)
            make.right.left.equalToSuperview().inset(40)
            make.height.equalTo(84)
        }
        // MARK: - next button style
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 20
        customView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(50)
            make.height.equalTo(64)
        }
        // MARK: - transition style
        let transitionImageView = UIImageView()
        transitionImageView.image = UIImage(named: "Group 134")
        customView.addSubview(transitionImageView)
        transitionImageView.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.top).offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(3)
        }
    }
    
}
