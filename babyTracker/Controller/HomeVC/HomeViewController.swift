//
//  ViewController.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 17.11.2023.
//

import UIKit
import SnapKit
import Hero
import Lottie

class HomeViewController: UIViewController {

    // MARK: - components
    let settingsButton = UIButton()
    let calendarButton = UIButton()
    let feedingButton = UIButton()
    let sleepButton = UIButton()
    let symptomsButton = UIButton()
    static var symptomsList = [Symptoms]()
    let lottie = LottieAnimationView()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsStyle()
        addTargetAction()
        UserDefaults.standard.set(true, forKey: "Value")

    }
    override func viewWillAppear(_ animated: Bool) {
        Globals.shared.selectedItem.removeAll()
    }
    // MARK: - add target actions
    func addTargetAction() {
        settingsButton.addTarget(self, action: #selector(settingsButtonClicked), for: .touchUpInside)
        calendarButton.addTarget(self, action: #selector(calendarButtonClicked), for: .touchUpInside)
        sleepButton.addTarget(self, action: #selector(sleepButtonClicked), for: .touchUpInside)
        feedingButton.addTarget(self, action: #selector(feedingButtonClicked), for: .touchUpInside)
        symptomsButton.addTarget(self, action: #selector(symptomsButtonClicked), for: .touchUpInside)
    }
    // MARK: button actions
    @objc func settingsButtonClicked() {
        let vc = SettingsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func calendarButtonClicked() {
        if !Globals.shared.allStatus.isEmpty {
            BabyStatusManager.fetchBabyValue(userId: Globals.shared.userID) { [self] in
                let vc = CalendarVC()
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
        } else {
            let vc = CalendarVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }

    }
    @objc func sleepButtonClicked() {
        let vc = SleepVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func feedingButtonClicked() {
        let vc = FeedingVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func symptomsButtonClicked() {
        let vc = SymptomsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    // MARK: - constraints style
    func constraintsStyle() {
        view.backgroundColor = .systemBackground
        // MARK: - home title
        let homeTitleLabel = UILabel()
        homeTitleLabel.text = "Home"
        homeTitleLabel.font = UIFont.systemFont(ofSize: 22)
        homeTitleLabel.sizeToFit()
        homeTitleLabel.textColor = .black
        view.addSubview(homeTitleLabel)
        homeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        // MARK: - settings button
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        view.addSubview(settingsButton)
        settingsButton.layer.zPosition = 5
        settingsButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeTitleLabel.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        // MARK: - calendar button
        calendarButton.setImage(UIImage(named: "calendar"), for: .normal)
        view.addSubview(calendarButton)
        calendarButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeTitleLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        // MARK: -
        feedingButton.setImage(UIImage(named: "feeding"), for: .normal)
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.bottom.equalTo(homeTitleLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(65)
        }
        // MARK: -
        sleepButton.setImage(UIImage(named: "sleep"), for: .normal)
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.bottom.equalTo(feedingButton.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(65)
        }
        // MARK: -
        symptomsButton.setImage(UIImage(named: "symptoms"), for: .normal)
        view.addSubview(symptomsButton)
        symptomsButton.snp.makeConstraints { make in
            make.bottom.equalTo(sleepButton.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(65)
        }
    }


}

