//
//  ViewController.swift
//  TaskManager
//
//  Created by Khusain on 26.04.2023.
//

import UIKit

class TasksViewController: UIViewController {
    // MARK: - Private constant
    var tasks: [Task] = []

    // MARK: - Variables
    var selectedCategory: CategoryTask? = .home {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentControlTypeOfTask: UISegmentedControl!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(
            UINib(nibName: "TasksTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TasksTableViewCell")
        tableView.separatorStyle = .none
    }
    
    // MARK: - Private @IBAction
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedCategory = .home
        case 1:
            selectedCategory = .family
        default:
            selectedCategory = .work
        }
    }
}

// MARK: - UITableViewDataSource
extension TasksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filteredTasks = tasks.filter { $0.category == selectedCategory }
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell", for: indexPath) as! TasksTableViewCell
        let task = tasks.filter { task in
            selectedCategory == nil || task.category == selectedCategory }[indexPath.row]
        cell.descriptionTask.attributedText = NSAttributedString(string: task.task, attributes: task.isCompleted ? [.strikethroughStyle: NSUnderlineStyle.single.rawValue] : [:])
        cell.dateToFinishTask.text = task.finishDate
        cell.creationTaskTime.text = task.date.formatted()
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}


// MARK: - UITableViewDelegate
extension TasksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// MARK: - TasksTableViewCellDelegate
extension TasksViewController: TasksTableViewCellDelegate {
    func completeButtonTapped(cell: TasksTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let filteredTasks = tasks.filter { $0.category == selectedCategory }
        let task = filteredTasks[indexPath.row]
        tasks = tasks.map {
            if $0 == task {
                var updatedTask = $0
                updatedTask.isCompleted = true
                return updatedTask
            } else {
                return $0
            }
        }
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
