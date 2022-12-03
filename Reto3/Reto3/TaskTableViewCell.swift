//
//  TaskTableViewCell.swift
//  Reto3
//
//  Created by Ana Isabel Llerena Huayta on 2/12/22.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func removeTask(cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    weak var delegate : TaskTableViewCellDelegate?

    func setup(task: Task){
        taskNameLabel.text = task.title

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

}
