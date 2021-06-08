//
//  Item.swift
//  ToDoList0602
//
//  Created by L on 2021/6/3.
//

import Foundation

struct Item {
    
    var title : String
    var content : String
    var todoDate : Date
    
    //轉換成String，並回傳值text。
    func changeDateToString() -> String {
        let formatter = DateFormatter()
        //要使用DateFormatter的元件來指定它的dateFormat（如何秀出時間）
        formatter.dateFormat = "yyyy年MM月dd日"
        //最後要選出你的時間秀在label上面
        let text = formatter.string(from: todoDate)
        return text
    }

}


