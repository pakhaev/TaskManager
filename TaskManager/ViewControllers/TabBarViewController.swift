//
//  TabBarViewController.swift
//  TaskManager
//
//  Created by Khusain on 29.04.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let tasksVC = viewControllers?[0] as? TasksViewController else {return}
        guard let statisticsVC = viewControllers?[2] as? StatisticsViewController else {return}
        
        let tasks = Task.getTasks()
        
        tasksVC.tasks = tasks
        statisticsVC.tasks = tasks
    }
    
}
