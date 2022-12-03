//
//  AddTaskViewController.swift
//  Reto3
//
//  Created by Ana Isabel Llerena Huayta on 2/12/22.
//

import UIKit

protocol AddTaskViewControllerDelegate {
    func information (_ viewController: AddTaskViewController, didCreateTask newTask:Task)
}


class AddTaskViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    
    var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.placeholder = "Title"
        descriptionTextField.placeholder = "Description"
        priorityTextField.placeholder = "Priority"
        
//        asegura que el usuario haya ingresado algo y no un espacio en blanco

        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true)
        
    }
    @IBAction func SaveButtonAction(_ sender: Any) {
        
        let title = titleTextField.text
        let description = descriptionTextField.text
        let priority = priorityTextField.text
        
        guard let t = title, !t.isEmpty else { return }
        guard let d = description, !d.isEmpty else { return }
        guard let p = priority, !p.isEmpty else { return }
                
        let newTask = Task(title: t, description: d, priority: p)
                
        //        paso 3: llamar al método del protocolo
        delegate?.information(self, didCreateTask: newTask)
        
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
