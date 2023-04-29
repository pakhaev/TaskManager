//
//  ViewController.swift
//  TaskManager
//
//  Created by Khusain on 29.04.2023.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()

        // Do any additional setup after loading the view.
    }
    

    private func setupViewControllers() {
        guard let newTaskVC = viewControllers?.first as? NewTaskViewController else {
            print("Error newTaskVC")
            return }
        guard let statisticsVC = viewControllers?.last as? StatisticsViewController else {
            print("Error statisticsVC")
            return }
        
        let tasks = Task.getTasks()
        
        newTaskVC.tasks = tasks
        statisticsVC.tasks = tasks
    }

}
