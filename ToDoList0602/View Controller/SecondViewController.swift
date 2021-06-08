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

    //顯示時間必須要有Formatter
    let formatter = DateFormatter()
    
    // MARK: - UI
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - textField 輸入時傳值？
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBOutlet weak var TodoDatePicker: UIDatePicker!
    @IBOutlet weak var testDateLabel: UILabel!
    
    // MARK: - ToDoDateValueChanged
    
    @IBAction func ToDoDateValueChanged(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        //要使用DateFormatter的元件來指定它的dateFormat（如何秀出時間）
        formatter.dateFormat = "yyyy年MM月dd日"
        //最後要選出你的時間秀在label上面
        testDateLabel.text = formatter.string(from: sender.date)
        
    }
    
    
    //第一頁傳到第二頁儲存
    //標題與內容
//    var titleString = String()
//    var contentString = String()
    var SecondVCString = Item(title: "", content: "", todoDate: Date())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //時區
        #warning("時間設定與顯示")
        TodoDatePicker.locale = NSLocale(localeIdentifier: "zh_TW") as Locale
        TodoDatePicker.date = SecondVCString.todoDate
        testDateLabel.text = SecondVCString.changeDateToString()

        //標題
        textField.placeholder = "輸入標題"
        textField.text = SecondVCString.title
        
        //內容
        contentTextField.placeholder = "輸入待辦事項"
        contentTextField.text = SecondVCString.content
        
        //刪除鈕
        textField.clearButtonMode = .whileEditing
        textField.becomeFirstResponder()
        textField.delegate = self
        
        
    }
    
    // MARK: - viewWillDisappear - 換頁時的delegate。
    override func viewWillDisappear(_ animated: Bool) {
        
        if let text = textField.text,
           let content = contentTextField.text {
            SecondVCString.title = text
            SecondVCString.content = content
            SecondVCString.todoDate = TodoDatePicker.date
            delegate?.setCellText(cellText: SecondVCString)
            
        }
    }
    
    // MARK: - textFieldShouldReturn
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
