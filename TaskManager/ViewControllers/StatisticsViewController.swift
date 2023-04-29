//
//  StatisticsViewController.swift
//  TaskManager
//
//  Created by Khusain on 26.04.2023.
//

import UIKit

final class StatisticsViewController: UIViewController {
    
    // MARK: - Private IBOutlet
    @IBOutlet private var completedSC: UISegmentedControl!
    @IBOutlet private var completedLabel: UILabel!
    @IBOutlet private var completedCountLabel: UILabel!
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Public properties
    var tasks: [Task] = []
    
    // MARK: - Private properties
    private var completedCounts: [CategoryTask: Int] = [:]
    private var allCases = CategoryTask.allCases
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        completedSC.setTitle(Completed.completed.rawValue, forSegmentAt: 0)
        completedSC.setTitle(Completed.inCompleted.rawValue, forSegmentAt: 1)
        
        setAllTasksCount(completedSC.selectedSegmentIndex)
    }
    
    // MARK: - IBAction
    @IBAction func completedSCTaped(_ sender: UISegmentedControl) {
        completedLabel.text = sender.titleForSegment(
            at: sender.selectedSegmentIndex
        )! + " задачи:"
        
        tableView.reloadData()
        setAllTasksCount(sender.selectedSegmentIndex)
    }
}

// MARK: - Extension StatisticsViewController
extension StatisticsViewController {
    private func setAllTasksCount(_ indexSegment: Int) {
        var completedCount = 0
        let flag = indexSegment == 0 ? true : false
        
        for task in tasks {
            completedCount += task.isCompleted == flag ? 1 : 0
        }
        
        completedCountLabel.text = String(completedCount)
        
        setCategoriesLabels(indexSegment)
    }
    
    private func setCategoriesLabels(_ indexSegment: Int) {
        let categories = CategoryTask.allCases
        let flag = indexSegment == 0 ? true : false

        for category in categories {
            completedCounts[category] = 0
        }

        for task in tasks {
            completedCounts[task.category]! += task.isCompleted == flag ? 1 : 0
        }
    }
    
    enum Completed: String {
        case completed = "Завершенные"
        case inCompleted = "Незавершенные"
    }
}

// MARK: - UITableViewDataSource
extension StatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        completedCounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "category",
            for: indexPath
        )
        var content = cell.defaultContentConfiguration()
        
        content.text = allCases[indexPath.row].rawValue +
            ": \(String(completedCounts[allCases[indexPath.row]]!))"
        
        cell.contentConfiguration = content
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension StatisticsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

