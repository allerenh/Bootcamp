//
//  TaskDetailViewController.swift
//  Reto3
//
//  Created by Ana Isabel Llerena Huayta on 2/12/22.
//

import UIKit

protocol TaskDetailViewControllerDelegate: AnyObject {
    func removeTaskDetail(position: Int)
}

class TaskDetailViewController: UIViewController {

   
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var removeTaskDetailButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: TaskDetailViewControllerDelegate?
    var task : Task?
    var position: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        priorityLabel.numberOfLines = 0
        titleLabel.text = "Title: \(task?.title ?? "")"
        descriptionLabel.text = "Description: \(task?.description ?? "")"
        priorityLabel.text = "Priority: \(task?.description ?? "")"
        
    }
    
    @IBAction func removeTaskButtonAction(_ sender: Any) {

        
        delegate?.removeTaskDetail(position: position)
        removeTaskDetailButton.isEnabled = false
        dismiss(animated: true)
        
    }


}
