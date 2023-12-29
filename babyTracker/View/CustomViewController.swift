//
//  CustomViewController.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 30.11.2023.
//

import UIKit
import SnapKit

class CustomViewController: UIView {

    // MARK: - components
    let backButton = UIButton()
    let titleLabel = UILabel()
    var textFieldTime = UITextField()
    var textFieldValue = UITextField()
    var textView = UITextView()
    var saveButton = CustomButton(title: "Save")
    let button = UIButton()
    // MARK: - lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(title: String,textFieldPlaceHolderOne: String,textFieldPlaceHolderSecond: String,textFieldOne: UITextField,textFieldSecond: UITextField,textViewLabel: String,textViewCustom: UITextView) {
        super.init(frame: .zero)
        constraintStyle(titleLabels: title, textFieldTimePlaceHolder: textFieldPlaceHolderOne, textFieldValuePlaceHolder: textFieldPlaceHolderSecond, textFieldOne: textFieldOne, textFieldSecond: textFieldSecond,textViewLabel: textViewLabel,textViewCustom: textViewCustom)
    }
    // MARK: - constarint style {
    func constraintStyle(titleLabels: String,textFieldTimePlaceHolder: String,textFieldValuePlaceHolder: String,textFieldOne: UITextField,textFieldSecond: UITextField,textViewLabel: String,textViewCustom: UITextView) {
        backgroundColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        titleLabel.sizeToFit()
        titleLabel.textColor = .purple
        titleLabel.text = titleLabels
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.centerX.equalToSuperview()
        }
        /// back button
        backButton.setImage(.vector, for: .normal)
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.left.equalToSuperview().offset(20)
        }
        /// first textfield
        textFieldTime = textFieldOne
        textFieldTime.placeholder = textFieldTimePlaceHolder
        textFieldTime.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        textFieldTime.layer.cornerRadius = 25
        textFieldTime.leftViewMode = .always
        textFieldTime.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        addSubview(textFieldTime)
        textFieldTime.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        /// second textfield
        textFieldValue = textFieldSecond
        textFieldValue.placeholder = textFieldValuePlaceHolder
        textFieldValue.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        textFieldValue.layer.cornerRadius = 25
        textFieldValue.leftViewMode = .always
        textFieldValue.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        addSubview(textFieldValue)
        textFieldValue.snp.makeConstraints { make in
            make.top.equalTo(textFieldTime.snp.bottom).offset(29)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        ///  button
        button.setImage(.next, for: .normal)
        addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(textFieldTime.snp.bottom).offset(35)
            make.right.equalToSuperview().offset(-36)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        /// textf view
        textView = textViewCustom
        textView.backgroundColor = UIColor(red: 0.954, green: 0.954, blue: 0.954, alpha: 1)
        textView.layer.cornerRadius = 18
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textAlignment = .left
        addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(textFieldValue.snp.bottom).offset(29)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(264)
        }
        
        /// save button
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(70)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
    }

}
