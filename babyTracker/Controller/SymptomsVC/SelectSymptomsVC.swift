//
//  SelectSymptomsVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 4.12.2023.
//

import UIKit
import SnapKit
import Lottie

class SelectSymptomsVC: UIViewController{
    // MARK: - components
    var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    var symptomsList = [Symptoms]()
    let saveButton = UIButton()
    let backButton = UIButton()
    let lottie = LottieAnimationView()

  
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        values()
        constraintStyle()
        targetAction()

    }

    // MARK: - button actions
    func targetAction() {
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func saveButtonClicked() {
        view.blurEffects(lottie: lottie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){ [self] in
    
            lottie.pause()
            dismiss(animated: true)
        }
    }
    // MARK: - helpers
    func values() {
        let symptoms1 = Symptoms(title: "Runny Nose", imageTitle: "runnyNose")
        let symptoms2 = Symptoms(title: "Heart Burn", imageTitle: "heartBurn")
        let symptoms3 = Symptoms(title: "Not Appetite", imageTitle: "notAppetite")
        let symptoms4 = Symptoms(title: "Rush", imageTitle: "rush")
        let symptoms5 = Symptoms(title: "Low Energy", imageTitle: "lowEnergy")
        let symptoms6 = Symptoms(title: "Nausea", imageTitle: "nausea")
        let symptoms7 = Symptoms(title: "Coucgh", imageTitle: "cough")
        let symptoms8 = Symptoms(title: "Fever", imageTitle: "fever")

        symptomsList.append(contentsOf: [symptoms1, symptoms2, symptoms3, symptoms4, symptoms5, symptoms6, symptoms7, symptoms8])
    }
    // MARK: - constraints style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        titleLabel.sizeToFit()
        titleLabel.textColor = .purple
        titleLabel.text = "Symptoms"
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(9)
            make.centerX.equalToSuperview()
        }
        /// back button
        backButton.setImage(.vector, for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(9)
            make.left.equalToSuperview().offset(20)
        }
        
        ///   collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 40, bottom: 5, right: 40)
        collectionView?.layer.cornerRadius = 10
        collectionView?.isScrollEnabled = true
        layout.scrollDirection = .vertical
        
        collectionView?.showsVerticalScrollIndicator = false
        guard let collectionView = collectionView else{
            return
        }
        collectionView.register(SymptomsCollectionVC.self, forCellWithReuseIdentifier: SymptomsCollectionVC.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        /// save button
        saveButton.isHidden = true
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 20
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.right.left.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
    }
    
    
}
extension SelectSymptomsVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return symptomsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = symptomsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  SymptomsCollectionVC.identifier, for: indexPath) as! SymptomsCollectionVC
        cell.imageView.image = UIImage(named: index.imageTitle ?? "boş")
        cell.symptom = index
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SymptomsCollectionVC
        if Globals.shared.selectedItem.count < 3 {
            Globals.shared.selectedItem.append(cell.symptom)
            cell.layer.cornerRadius = 25
            cell.layer.borderColor = UIColor.purple.cgColor
            cell.layer.borderWidth = 2
            if cell.isSelected == true {
                saveButton.isHidden = false
            } else {
                saveButton.isHidden = true
            }
        } else {
            Alerts.alertAction(title: "Error", message: "Please just select most two item", vc: self)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SymptomsCollectionVC
    }

}
