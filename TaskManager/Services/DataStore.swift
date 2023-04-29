//
//  DateStore.swift
//  TaskManager
//
//  Created by Иван on 27.04.2023.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    var tasks = [
        "Покушать",
        "Помочь жене",
        "Поработать",
        "Выйти прогуляться",
        "Сходить в магазин",
        "Помыть машину"
    ]
    
    var categories = [
        CategoryTask.home,
        CategoryTask.family,
        CategoryTask.work,
        CategoryTask.home,
        CategoryTask.home,
        CategoryTask.work
    ]
    
    var finishDate = [
        "01.04",
        "",
        "02.01",
        "22.03",
        "",
        "15.03"
    ]
    
    var isCompleted = [
        true,
        false,
        true,
        false,
        false,
        true
    ]
    
    var date = [
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date()
    ]
    
    func display() {
        print(tasks)
    }
    
    private init() {}
}
