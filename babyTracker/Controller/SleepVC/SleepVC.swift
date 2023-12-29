//
//  SleepVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 30.11.2023.
//

import UIKit
import Lottie

class SleepVC: UIViewController {

    // MARK: - components
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let textView = UITextView()
    let timePicker = UIDatePicker()
    let wokeUpPicker = UIDatePicker()
    let formatter = DateFormatter()
    var customView: CustomViewController!
    let lottie = LottieAnimationView()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        addTargetActions()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - helpers
    func dateFormatter() {
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm a"
    }
    // MARK: - button actions
    func addTargetActions() {
        customView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: .valueChanged)
        wokeUpPicker.addTarget(self, action: #selector(wokeUpPickerValueChanged(sender:)), for: .valueChanged)
        customView.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func timePickerValueChanged(sender : UIDatePicker) {
        dateFormatter()
        firstTextField.text = formatter.string(from: sender.date)
    }
    @objc func wokeUpPickerValueChanged(sender: UIDatePicker) {
        dateFormatter()
        secondTextField.text = formatter.string(from: sender.date)
    }
    @objc func saveButtonClicked() {
        guard let feelSleep = firstTextField.text ,
        let wokeUp = secondTextField.text,
        let note = textView.text else{return}
        
        BabyStatusManager.uploadBabyValue(userId: Globals.shared.userID, timeOne: feelSleep, time: wokeUp, note: note, image: "icon_sleep_blue", type: "sleep")

        view.blurEffects(lottie: lottie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            lottie.pause()
            dismiss(animated: true)
        }
    }
    // MARK: - constraint style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        /// custom view
        customView = CustomViewController(title: "Sleep", textFieldPlaceHolderOne: "Fell Sleep", textFieldPlaceHolderSecond: "Woke Up", textFieldOne: firstTextField, textFieldSecond: secondTextField,textViewLabel: "Note",textViewCustom: textView)
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
        /// woke up time picker style
        wokeUpPicker.datePickerMode = .time
        wokeUpPicker.backgroundColor = .clear
        customView.textFieldValue.addSubview(wokeUpPicker)
        wokeUpPicker.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.equalTo(75)
            make.height.equalTo(50)
        }
    }


}
