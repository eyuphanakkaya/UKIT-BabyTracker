//
//  DetailVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 13.12.2023.
//

import UIKit

class DetailVC: UIViewController {
    // MARK: - components
    let firstTextField = UITextField()
    let secondTextField = UITextField()
    let textView = UITextView()
    var customView: CustomViewController!

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintStyle()
        // Do any additional setup after loading the view.
    }
    // MARK: - constraint style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        /// custom view
        customView = CustomViewController(title: "Detail", textFieldPlaceHolderOne: "", textFieldPlaceHolderSecond: "", textFieldOne: firstTextField, textFieldSecond: secondTextField,textViewLabel: "",textViewCustom: textView)
        view.addSubview(customView)
        customView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
        })
        ///  design
        firstTextField.isUserInteractionEnabled = false
        secondTextField.isUserInteractionEnabled = false
        textView.isUserInteractionEnabled = false
        customView.saveButton.isHidden = true
        customView.button.isHidden = true
        customView.backButton.isHidden = true
        
    }
    
}
