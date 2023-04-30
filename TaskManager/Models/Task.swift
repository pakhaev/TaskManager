//
//  Task.swift
//  TaskManager
//
//  Created by Khusain on 29.04.2023.
//
import Foundation

struct Task {
    let task: String
    let category: CategoryTask
    let finishDate: String
    var isCompleted: Bool
    let date: Date
    
    static func getTasks() -> [Task] {
        var resultTasks: [Task] = []
        let dataStore = DataStore.shared
        
        let tasks = dataStore.tasks
        let finishDate = dataStore.finishDate
        let categories = dataStore.categories
        let date = dataStore.date
        let isCompleted = dataStore.isCompleted
        
        let minCount = min(
            tasks.count,
            finishDate.count,
            categories.count,
            date.count,
            isCompleted.count
        )
        
        for index in 0..<minCount {
            let task = Task(
                task: tasks[index],
                category: categories[index],
                finishDate: finishDate[index],
                isCompleted: isCompleted[index],
                date: date[index]
            )
            
            resultTasks.append(task)
        }
        
        return resultTasks
    }
}


enum CategoryTask: String, CaseIterable {
    case home = "Дом"
    case work = "Работа"
    case family = "Семья"
}
