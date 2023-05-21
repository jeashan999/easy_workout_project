//
//  CreateScheduleController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class CreateScheduleController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let popupView = UIView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let workoutLabel = UILabel()
    private let placeLabel = UILabel()
    private let dateLabel = UILabel()
    private let timeLabel = UILabel()
    private let nameTextField = UITextField()
    private let ageTextField = UITextField()
    private let workoutPickerView = UIPickerView()
    private let placeTextField = UITextField()
    private let dateTimePicker = UIDatePicker()
    private let submitButton = UIButton()
    
    var onSubmit: ((_ name: String, _ workout: String, _ place: String, _ date: Date) -> Void)? // Updated: Include place and date parameters
    
    let workoutOptions = ["Running", "Weightlifting", "Yoga", "Swimming", "Cycling"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let popupWidth: CGFloat = view.bounds.width
        let popupHeight: CGFloat = view.bounds.height / 2
        popupView.frame = CGRect(x: 0, y: view.bounds.height, width: popupWidth, height: popupHeight)
        popupView.backgroundColor = .systemBackground
        
        scrollView.frame = CGRect(x: 0, y: 0, width: popupWidth, height: popupHeight)
        scrollView.contentSize = CGSize(width: popupWidth, height: popupHeight)
        
        contentView.frame = CGRect(x: 0, y: 0, width: popupWidth, height: popupHeight)
        
        popupView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(popupView)
        
        nameLabel.text = "Title:"
        nameLabel.textAlignment = .center
        nameLabel.frame = CGRect(x: 0, y: 10, width: popupWidth, height: 30)
        contentView.addSubview(nameLabel)
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.frame = CGRect(x: 20, y: nameLabel.frame.maxY + 5, width: popupWidth - 40, height: 30)
        contentView.addSubview(nameTextField)
      
        workoutLabel.text = "Workout:"
        workoutLabel.textAlignment = .center
        workoutLabel.frame = CGRect(x: 0, y: nameTextField.frame.maxY + 10, width: popupWidth, height: 30)
        contentView.addSubview(workoutLabel)
        
        workoutPickerView.delegate = self
        workoutPickerView.dataSource = self
        workoutPickerView.frame = CGRect(x: 20, y: workoutLabel.frame.maxY + 5, width: popupWidth - 40, height: 70)
        contentView.addSubview(workoutPickerView)
        
        placeLabel.text = "Place:"
        placeLabel.textAlignment = .center
        placeLabel.frame = CGRect(x: 0, y: workoutPickerView.frame.maxY + 10, width: popupWidth, height: 30)
        contentView.addSubview(placeLabel)
        
        placeTextField.borderStyle = .roundedRect
        placeTextField.frame = CGRect(x: 20, y: placeLabel.frame.maxY + 5, width: popupWidth - 40, height: 30)
        contentView.addSubview(placeTextField)
        
        dateLabel.text = "Date and Time:"
        dateLabel.textAlignment = .center
        dateLabel.frame = CGRect(x: 0, y: placeTextField.frame.maxY + 10, width: popupWidth, height: 30)
        contentView.addSubview(dateLabel)
        
        dateTimePicker.datePickerMode = .dateAndTime
        dateTimePicker.frame = CGRect(x: 20, y: dateLabel.frame.maxY + 3, width: popupWidth - 40, height: 30)
        contentView.addSubview(dateTimePicker)
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.frame = CGRect(x: (popupWidth - 100) / 2, y: dateTimePicker.frame.maxY + 10, width: 100, height: 40)
        contentView.addSubview(submitButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.popupView.frame.origin.y = self.view.bounds.height - self.popupView.bounds.height
        }
    }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: view)
        if !popupView.frame.contains(location) {
            dismissPopup()
        }
    }
    
    private func dismissPopup() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popupView.frame.origin.y = self.view.bounds.height
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc private func submitButtonTapped() {
        guard let name = nameTextField.text,
              let selectedWorkout = workoutOptions[safe: workoutPickerView.selectedRow(inComponent: 0)],
              let place = placeTextField.text
        else {
            print("Invalid input")
            return
        }

        let date = dateTimePicker.date

        onSubmit?(name, selectedWorkout, place, date)

        dismissPopup()
    }

    
    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return workoutOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return workoutOptions[row]
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
