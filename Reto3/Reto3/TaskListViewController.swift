//
//  ViewController.swift
//  Reto3
//
//  Created by Ana Isabel Llerena Huayta on 2/12/22.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var taskListTableView: UITableView!
    
    var data : [Task] = []
    var position : Int = 0

    @IBAction func AddTaskAction(_ sender: Any) {
       showAddTaskVC()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.taskListTableView.dataSource = self
        self.taskListTableView.delegate = self
        
    }
    
    func showAddTaskVC () {
        let addTaskVC = storyboard?.instantiateViewController(withIdentifier: "addTaskVC") as! AddTaskViewController
        addTaskVC.delegate = self
        present(addTaskVC, animated: true)
        
    }
    
    func showAlert() {
        if data.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "Please, add a task", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                self.showAddTaskVC()
            }))
            self.dismiss(animated: false)
            present(alert, animated: true)
        }

    }

}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = taskListTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = data[indexPath.row]
        cell.setup(task: task)
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "TaskDetailViewController") as? TaskDetailViewController else {
            return
        }
        position = indexPath.row
        detailVC.task = data[position]
        detailVC.position = position
        detailVC.delegate = self
        
        present(detailVC, animated: true)
    }
    
}

extension TaskListViewController: AddTaskViewControllerDelegate {
    func information(_ viewController: AddTaskViewController, didCreateTask newTask: Task) {
        data.append(newTask)
        self.taskListTableView.reloadData()
    }
    
}


extension TaskListViewController: TaskDetailViewControllerDelegate {
    func removeTaskDetail(position: Int) {
        data.remove(at: position)
        showAlert()
        taskListTableView.reloadData()
    }
    
   
    
}
