//
//  TasksTableViewCell.swift
//  TaskManager
//
//  Created by Иван on 27.04.2023.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    // MARK: - IBOutlet's
    @IBOutlet weak var creationTaskTime: UILabel!
    @IBOutlet weak var descriptionTask: UILabel!
    @IBOutlet weak var dateToFinishTask: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Public variables
    weak var delegate: TasksTableViewCellDelegate?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private function
    @objc private func completeButtonTapped() {
        delegate?.completeButtonTapped(cell: self)
    }
}

// MARK: - Protocol TasksTableViewCellDelegate
protocol TasksTableViewCellDelegate: AnyObject {
    func completeButtonTapped(cell: TasksTableViewCell)
}
