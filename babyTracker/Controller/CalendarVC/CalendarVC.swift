//
//  CalenderVC.swift
//  babyTracker
//
//  Created by Eyüphan Akkaya on 8.12.2023.
//

import UIKit
import Lottie

class CalendarVC: UIViewController {
    
    // MARK: - components

    let backButton = UIButton()
    let allButton = UIButton()
    let sleepButton = UIButton()
    let feedingButton = UIButton()
    let symtomsButton = UIButton()
    let tableView = UITableView()
    let activityIndicator = UIActivityIndicatorView()
    var selectedEventType: IllnessType!
    let lottie = LottieAnimationView()
    
    
    // MARK: - lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedEventType = .all
        constraintStyle()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        BabyStatusManager.fetchBabyValue(userId: Globals.shared.userID) { [self] in
            tableView.reloadData()
        }
        buttonActions()
    }
    // MARK: - helper
    func dateFormat(completion: @escaping(String) -> Void) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MMM d"
        let formatDate = dateFormatter.string(from: currentDate)
        completion(formatDate)
    }
    // MARK: - button actions
    func buttonActions() {
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        allButton.addTarget(self, action: #selector(allButtonClicked), for: .touchUpInside)
        sleepButton.addTarget(self, action: #selector(sleepButtonClicked), for: .touchUpInside)
        feedingButton.addTarget(self, action: #selector(feedingButtonClicked), for: .touchUpInside)
        symtomsButton.addTarget(self, action: #selector(symtomsButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func allButtonClicked() {
        feedingButton.setImage(.feeds, for: .normal)
        symtomsButton.setImage(.symptomss, for: .normal)
        sleepButton.setImage(.sleeps, for: .normal)
        
        selectedEventType = .all
        allButton.setTitleColor(.purple, for: .normal)
        tableView.reloadData()
    }
    @objc func sleepButtonClicked() {
        allButton.setTitleColor(UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1), for: .normal)
        feedingButton.setImage(.feeds, for: .normal)
        symtomsButton.setImage(.symptomss, for: .normal)
        
        selectedEventType = .sleep
        sleepButton.setImage(.iconSleepBlue, for: .normal)
        tableView.reloadData()
        
    }
    @objc func feedingButtonClicked() {
        allButton.setTitleColor(UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1), for: .normal)
        sleepButton.setImage(.sleeps, for: .normal)
        symtomsButton.setImage(.symptomss, for: .normal)
        
        selectedEventType = .feeding
        feedingButton.setImage(.iconFeedingPurple, for: .normal)
        tableView.reloadData()
        
    }
    @objc func symtomsButtonClicked() {
        allButton.setTitleColor(UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1), for: .normal)
        feedingButton.setImage(.feeds, for: .normal)
        sleepButton.setImage(.sleeps, for: .normal)
        
        selectedEventType = .symptoms
        symtomsButton.setImage(.iconPumpingOrange, for: .normal)
        tableView.reloadData()
        
    }
    // MARK: - constraint style
    func constraintStyle() {
        view.backgroundColor = .systemBackground
        /// title label
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        titleLabel.sizeToFit()
        titleLabel.textColor = .purple
        titleLabel.text = "Calender"
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            make.centerX.equalToSuperview()
        }
        /// back button
        backButton.setImage(.vector, for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            make.left.equalToSuperview().offset(20)
        }
        /// time label
        let timeLabel = UILabel()
        dateFormat { value in
            timeLabel.text = value
        }
        
        timeLabel.textColor = .black
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        /// all button
        allButton.setTitle("All", for: .normal)
        allButton.setTitleColor(.purple, for: .normal)
        allButton.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        view.addSubview(allButton)
        allButton.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(75)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        /// feeding button
        feedingButton.setImage(.feeds, for: .normal)
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.left.equalTo(allButton.snp.right).offset(22)
            make.centerY.equalTo(allButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// sleep  button
        sleepButton.setImage(.sleeps, for: .normal)
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.left.equalTo(feedingButton.snp.right).offset(22)
            make.centerY.equalTo(feedingButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        /// symptoms  button
        symtomsButton.setImage(.symptomss, for: .normal)
        view.addSubview(symtomsButton)
        symtomsButton.snp.makeConstraints { make in
            make.left.equalTo(sleepButton.snp.right).offset(22)
            make.centerY.equalTo(allButton.snp.centerY)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        /// table view style
        tableView.register(CalendarTableVC.self, forCellReuseIdentifier: CalendarTableVC.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(98)
            make.bottom.equalToSuperview()
        }
        tableView.reloadData()
    }
    
    
}
extension CalendarVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedEventType {
        case .all:
            return Globals.shared.allStatus.count
        case .feeding :
            let filtered = Globals.shared.allStatus.filter { $0.type == "feeding" }
            return filtered.count
        case .sleep:
            let filtered = Globals.shared.allStatus.filter { $0.type == "sleep" }
            
            return filtered.count
        case .symptoms:
            let symptoms = Globals.shared.allStatus.filter { $0.type == "symptoms" }
            return symptoms.count
        case .none:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = Globals.shared.allStatus[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableVC.identifier, for: indexPath) as! CalendarTableVC
        switch selectedEventType {
        case .all:
            cell.timeLabel.text = index.timeOne
            cell.titleLabel.text = index.note
            cell.note.text = index.time
            
            cell.imageViews.image = UIImage(named: index.image)
        case .feeding :
            let filtered = Globals.shared.allStatus.filter { $0.type == "feeding" }
            let feed = filtered[indexPath.row]
            
            cell.timeLabel.text = feed.timeOne
            cell.titleLabel.text = feed.note
            cell.note.text = feed.time
            
            cell.imageViews.image = UIImage(named: feed.image)
            
        case .sleep:
            let filtered = Globals.shared.allStatus.filter { $0.type == "sleep" }
            let sleep = filtered[indexPath.row]
            cell.timeLabel.text = sleep.timeOne
            cell.titleLabel.text = sleep.note
            cell.note.text = sleep.time
            
            cell.imageViews.image = UIImage(named: sleep.image)
            
        case .symptoms:
            let filtered = Globals.shared.allStatus.filter { $0.type == "symptoms" }
            let symptoms = filtered[indexPath.row]
            cell.timeLabel.text = symptoms.timeOne
            cell.titleLabel.text = symptoms.note
            cell.note.text = symptoms.time
            
            cell.imageViews.image = UIImage(named: symptoms.image)
            
        case .none:
            print("error")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! CalendarTableVC
        let vc = DetailVC()
        vc.firstTextField.text = cell.titleLabel.text
        vc.secondTextField.text = cell.timeLabel.text
        vc.textView.text = cell.note.text
        present(vc, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let index = Globals.shared.allStatus[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { action, view, completion in
            BabyStatusManager.deleteBabyValue(userId: Globals.shared.userID, documentId: index.id) {
                BabyStatusManager.fetchBabyValue(userId: Globals.shared.userID) {
                    tableView.reloadData()
                }
            }
            Alerts.alertAction(title: "Delete", message: "Delete is successed", vc: self)
            completion(true)
        }
        deleteAction.backgroundColor = .red
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [self] action, view, completion in
            checkDestination(index: index)
            completion(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction,editAction])
        return configuration
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func checkDestination(index: BabyFeel) {
        let vc = EditVC()
        vc.value = index
        vc.modalPresentationStyle = .fullScreen
        if index.type == "sleep" {
            vc.firstTextField.text = index.timeOne
            vc.secondTextField.text = index.time
            vc.textView.text = index.note
            self.present(vc, animated: true)
        } else if index.type == "feeding" {
            vc.firstTextField.text = index.timeOne
            vc.secondTextField.text = index.time
            vc.textView.text = index.note
            vc.wokeUpPicker.isHidden = true
            self.present(vc, animated: true)
        } else if index.type == "symptoms"{
            vc.firstTextField.text = index.timeOne
            vc.secondTextField.text = index.time
            vc.textView.text = index.note
            vc.wokeUpPicker.isHidden = true
            vc.timePicker.isHidden = true
            self.present(vc, animated: true)
        }
    }
}
