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
        [
            Task(
                task: "Покушать",
                category: .home,
                finishDate: "30.04",
                isCompleted: false,
                date: Date()
            ),
            Task(
                task: "Помочь жене",
                category: .family,
                finishDate: "01.05",
                isCompleted: true,
                date: Date()
            ),
            Task(
                task: "Поработать",
                category: .work,
                finishDate: "02.05",
                isCompleted: false,
                date: Date()
            ),
        ]
    }
}


enum CategoryTask: String, CaseIterable {
    case home = "Дом"
    case work = "Работа"
    case family = "Семья"
}
