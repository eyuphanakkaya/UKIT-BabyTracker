//
//  EditVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 14.12.2023.
//

import UIKit

class EditVC: UIViewController {
    // MARK: - components
    var value: BabyFeel!
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let textView = UITextView()
    let timePicker = UIDatePicker()
    let formatter = DateFormatter()
    let wokeUpPicker = UIDatePicker()
    var customView: CustomViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        addTargetActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        addedSelectedSymptoms()
    }
    // MARK: - helpers
    func dateFormatter() {
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm a"
    }
    func addedSelectedSymptoms() {
        for (index, x) in Globals.shared.selectedItem.enumerated() {
            customView.textFieldValue.text?.append(x.title ?? "")
            
            if index < Globals.shared.selectedItem.count - 1 {
                customView.textFieldValue.text?.append(", ")
            }
        }
    }
    // MARK: - button actions
    func addTargetActions() {
        customView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        customView.saveButton.addTarget(self, action: #selector(updateButtonClicked), for: .touchUpInside)
        customView.button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: .valueChanged)
        wokeUpPicker.addTarget(self, action: #selector(wokeUpPickerValueChanged(sender:)), for: .valueChanged)
    }
    @objc func updateButtonClicked() {
        guard let textOne = firstTextField.text,
              let textSecond = secondTextField.text,
              let textViews = textView.text else{ return }
        BabyStatusManager.updateBabyValue(userId: Globals.shared.userID, documentId: value.id, timeOne: textOne, time: textSecond, note: textViews)
        Alerts.alertAction(title: "Update", message: "Update is successed", vc: self)
        print("update")
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
    @objc func buttonClicked() {
        let vc = SelectSymptomsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    // MARK: - constraint style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        /// custom view
        customView = CustomViewController(title: "Edit", textFieldPlaceHolderOne: "", textFieldPlaceHolderSecond: "", textFieldOne: firstTextField, textFieldSecond: secondTextField,textViewLabel: "",textViewCustom: textView)
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
        customView.saveButton.setTitle("Update", for: .normal)
    }
}
