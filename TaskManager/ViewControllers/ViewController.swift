//
//  ViewController.swift
//  TaskManager
//
//  Created by Khusain on 29.04.2023.
//

import UIKit

class ViewController: UITabBarController {
    
//    private let tasks = Task.getTasks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        guard let tasksVC = viewControllers?[0] as? TasksViewController else {return}
//        guard let newTaskVC = viewControllers?[1] as? NewTaskViewController else {return}
        guard let statisticsVC = viewControllers?[2] as? StatisticsViewController else {return}
        
        let tasks = Task.getTasks()
        
        tasksVC.tasks = tasks
        statisticsVC.tasks = tasks
    }
    
}
