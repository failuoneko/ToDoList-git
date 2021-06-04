//
//  SecondViewController.swift
//  ToDoList0602
//
//  Created by L on 2021/6/3.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - Delegate
    var delegate: PassingValueDelegate?
    
    // MARK: - UI
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - textField 輸入時傳值？
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.placeholder = "請輸入文字"
        textField.clearButtonMode = .whileEditing
        textField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let textDetail = textField.text{
            delegate?.setCellText(cellText: textDetail)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        textField.resignFirstResponder()
        navigationController?.popViewController(animated: true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
