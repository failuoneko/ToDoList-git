//
//  File.swift
//  ToDoList0602
//
//  Created by L on 2021/6/3.
//

import UIKit

class navigationBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBarAppear = UINavigationBar.appearance()
        navigationBarAppear.tintColor = UIColor.orange
        navigationBarAppear.barTintColor = UIColor.black
        navigationBarAppear.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
    }
    
}

