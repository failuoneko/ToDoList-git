//
//  TableViewController.swift
//  ToDoList0602
//
//  Created by L on 2021/6/3.
//

import UIKit

class TableViewController: UITableViewController, PassingValueDelegate{
    
    var itemArray:[Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "ToDoList"
        let item1: Item = Item(title: "第一項")
        itemArray.append(item1)
        
    }
    
    

    // MARK: - addButton
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "toSecondViewController") as? SecondViewController{
            secondVC.delegate = self
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        
    }
    
    // MARK: - prepare?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - Delegation Func，實作的內容。
    func setCellText(cellText: String) {
        if cellText == "" {
            let itemAdd: Item = Item(title: "未命名")
            self.itemArray.append(itemAdd)
        }else{
            let itemAdd: Item = Item(title: cellText)
            self.itemArray.append(itemAdd)
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
    
    // MARK: - 刪除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

}
