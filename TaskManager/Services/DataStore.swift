//
//  DateStore.swift
//  TaskManager
//
//  Created by Иван on 27.04.2023.
//

import Foundation

struct Task: Equatable{
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
                isCompleted: false,
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


enum CategoryTask: String {
    case home = "Дом"
    case work = "Работа"
    case family = "Семья"
}
