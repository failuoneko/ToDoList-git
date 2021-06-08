//
//  TableViewController.swift
//  ToDoList0602
//
//  Created by L on 2021/6/3.
//

import UIKit

class TableViewController: UITableViewController, PassingValueDelegate{
    
    var itemArray:[Item] = []
    
    
    var editCell: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "ToDoList"
        
        let item1: Item = Item(title: "第一項", content: "第一項123", todoDate: Date())
        itemArray.append(item1)
        
        #warning("loadDate")
//        loadData()
    }
    
    
    
    // MARK: - addButton
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "toSecondViewController") as? SecondViewController{
            secondVC.delegate = self
            editCell = false
            self.navigationController?.pushViewController(secondVC, animated: true)
            
        }
    }
    
    // MARK: - 儲存資料？
    #warning("儲存資料的問題")
    func saveData() {
        UserDefaults.standard.set(itemArray, forKey: "itemArray")
    }
    
//    func loadData() {
//        itemArray = UserDefaults.standard.object(forKey: "itemArray") as? [Item] ?? <#default value#>
//    }
    
    
    // MARK: - Delegation Func，實作的內容。
    func setCellText(cellText: Item) {
        if editCell == false {
            if cellText.title == "" {
                let itemAdd: Item = Item(title: "未命名", content: cellText.content, todoDate: cellText.todoDate)
                self.itemArray.append(itemAdd)
            }else{
                self.itemArray.append(cellText)
            }
        }else{
            #warning("edit編輯標題與內容？")
            
            
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        #warning("cell右邊顯示時間")
        cell.detailTextLabel?.text = item.changeDateToString()
        
        return cell
    }
    
    // MARK: - didSelectRowAt
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "toSecondViewController") as? SecondViewController{
            secondVC.delegate = self
            editCell = true
            
            let item = itemArray[indexPath.row]
            //傳值到下一頁
            secondVC.SecondVCString = item
            
            self.navigationController?.pushViewController(secondVC, animated: true)
            
        }
    }
    
    
    
    // MARK: - 刪除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 刪除 numberArray 中的該項目
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: - 移動cell
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 將移動的項目賦值給item
        let item = itemArray[sourceIndexPath.row]
        // 將原有位置的項目刪除
        itemArray.remove(at: sourceIndexPath.row)
        // 將剛剛移動的項目插入到新的位置(目的地)
        itemArray.insert(item, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
