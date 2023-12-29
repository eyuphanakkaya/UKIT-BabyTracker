//
//  SymptomsVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 1.12.2023.
//

import UIKit
import Lottie

class SymptomsVC: UIViewController {

    // MARK: - components
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let textView = UITextView()
    let time = Date()
    let formatter = DateFormatter()
    let timePicker = UIDatePicker()
    let lottie = LottieAnimationView()
    var customView: CustomViewController!
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        addTargetActions()
        timePickers()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        addedSelectedSymptoms()
    }
    // MARK: - button actions
    func addTargetActions() {
        customView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        customView.button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        customView.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func buttonClicked() {
        let vc = SelectSymptomsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func saveButtonClicked() {
        guard let time = firstTextField.text,
               let symptom = secondTextField.text,
               let note = textView.text else{return}

        BabyStatusManager.uploadBabyValue(userId: Globals.shared.userID, timeOne: time, time: symptom, note: note, image: "icon_pumping_orange", type: "symptoms")
                
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
        customView = CustomViewController(title: "Symptoms", textFieldPlaceHolderOne: "Time", textFieldPlaceHolderSecond: "Symptoms", textFieldOne: firstTextField, textFieldSecond: secondTextField,textViewLabel: "Note",textViewCustom: textView)
        customView.button.isHidden = false
        view.addSubview(customView)
        customView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
        })
    }
    // MARK: - helpers
    func timePickers() {
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm a"
        firstTextField.text = formatter.string(from: time)
    }
    func addedSelectedSymptoms() {
        for (index, x) in Globals.shared.selectedItem.enumerated() {
            customView.textFieldValue.text?.append(x.title ?? "")
            
            if index < Globals.shared.selectedItem.count - 1 {
                customView.textFieldValue.text?.append(", ")
            }
        }
    }

}
