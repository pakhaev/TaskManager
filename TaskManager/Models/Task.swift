//
//  Task.swift
//  TaskManager
//
//  Created by Khusain on 26.04.2023.
//

import Foundation

struct Task {
    let task: String
    let category: CategoryTask
    let isCompleted: Bool
    let date: Date
    
    static func getTasks() -> [Task] {
        [
            Task(
                task: "Выполнить ДЗ",
                category: .home,
                isCompleted: false,
                date: Date()
            ),
            Task(
                task: "Пойти за покупками",
                category: .family,
                isCompleted: true,
                date: Date()
            ),
            Task(
                task: "Что-то еще сделать",
                category: .work,
                isCompleted: true,
                date: Date()
            ),
            Task(
                task: "Что-то еще сделать",
                category: .work,
                isCompleted: true,
                date: Date()
            )
        ]
    }
}

enum CategoryTask: String, CaseIterable {
    case home = "Дом"
    case work = "Работа"
    case family = "Семья"
}
