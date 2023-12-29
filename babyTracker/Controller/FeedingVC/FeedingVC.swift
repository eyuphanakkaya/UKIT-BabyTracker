//
//  FeedingVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 30.11.2023.
//

import UIKit
import Lottie

class FeedingVC: UIViewController {
    // MARK: - components
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let textView = UITextView()
    let formatter = DateFormatter()
    let timePicker = UIDatePicker()
    var customView: CustomViewController!
    let lottie = LottieAnimationView()

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        addTargetActions()
    }
    // MARK: - button actions
    func addTargetActions() {
        customView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender: )), for: .valueChanged)
        customView.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func timePickerValueChanged(sender : UIDatePicker) {
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm a"
        firstTextField.text = formatter.string(from: sender.date)
    }
    @objc func saveButtonClicked() {
        guard let time = firstTextField.text,
               let amount = secondTextField.text,
               let note = textView.text else{return}
        BabyStatusManager.uploadBabyValue(userId: Globals.shared.userID, timeOne: time, time: amount, note: note, image: "icon_feeding_purple", type: "feeding")
        
        view.blurEffects(lottie: lottie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){ [self] in
            lottie.pause()
            dismiss(animated: true)
        }
    }
    // MARK: - constraint style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        /// custom view 
        customView = CustomViewController(title: "Feeding", textFieldPlaceHolderOne: "Time", textFieldPlaceHolderSecond: "Amount (ml)", textFieldOne: firstTextField, textFieldSecond: secondTextField,textViewLabel: "Note",textViewCustom: textView)
        customView.button.isHidden = true
        view.addSubview(customView)
        customView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
        })
        /// time picker style
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = .clear
        customView.textFieldTime.addSubview(timePicker)
        timePicker.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.equalTo(75)
            make.height.equalTo(50)
        }
    }
    
}
