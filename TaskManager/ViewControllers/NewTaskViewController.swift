//
//  NewTaskViewController.swift
//  TaskManager
//
//  Created by Denis Kitaev on 27.04.2023.
//

import UIKit

final class NewTaskViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    
    var tasks: [Task] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
 
    @IBAction func addingButtonTapped() {
        let task = Task(
            task: textView.text,
            category: setTaskCategory(),
            finishDate: "",
            isCompleted: false,
            date: datePicker.date
        )
        
        tasks.append(task)
    }
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setTaskCategory() -> CategoryTask {
        var category: CategoryTask = .home
        
        switch segmentedControl.selectedSegmentIndex {
        case 0: category = .home
        case 1: category = .work
        default: category = .family
        }
        
        return category
    }
}
