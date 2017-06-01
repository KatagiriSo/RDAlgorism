//
//  main.swift
//  InsertionSort
//
//  Created by KatagiriSo on 2016/11/04.
//  Copyright © 2016年 Rodhos. All rights reserved.
//

import Foundation


// O(n^2)
// ある程度整列しているデータでは非常に速い

// 1,3,4,6,2,5 ... 1,3,4,6　は素通り

// 1,3,4,6,"2",5 ... "2"
// 1,"2",3,4,6,5 ... 左から比較していき3で止まる

// 1,2,3,4,6,"5" ... 1,2,3,4,6は素通り
// 1,2,3,4,"5",6 ... "5"
// 1,2,3,4,5,6 ... 左から比較して6で止まる


var list = [3,2,3,5,32,32,1,23,5,6,3,1,4,5,3,23,21]



func proc(list:inout [Int]) -> Bool {
    
    guard let index = process_1(list: list) else {
        return false
    }
    
    return process_2(index: index, list: &list)
}






// 各処理 ========

// 整列してない数を左からみていく
func process_1(list:[Int]) -> Int? {
    
    for (index, _) in list.enumerated() {
        
        if index+1 >= list.count {
            return nil
        }
        
        if  list[index] > list[index+1] {
            return index + 1
        }
    }
    return nil
}

// 左から見て整列していない数よりはじめて大きな数があるところにその数を入れる
func process_2(index:Int, list:inout [Int]) -> Bool {
    let x = list.remove(at: index)
    
    let index2 = list.index { x <= $0 }
    
    if let index2 = index2 {
        list.insert(x, at: index2)
        return true
    }
    
    list.append(x)
    return false
}




while proc(list: &list) {
}

print("\(list)")


