//
//  Sequence.swift
//  algorithm
//
//  Created by xiangyu on 2017/5/8.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import Foundation
/*
 插入排序
 选择排序
 交换排序
 归并排序
 基数排序
 内部排序（使用内存）
 排序
 外部排序（内存和外存结合使用）
 
 */
class Sequence {
  
  //MARK: - 插入排序
  class func insertSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    for i in 1..<array.count {
      if array[i] < array[i-1] {
        var j = i - 1
        let x = array[i] // 哨兵，即待插入数据
        array[i] = array[i-1]
        while j >= 0, x < array[j] {//寻找正确的插入位置
          array[j+1] = array[j]
          j -= 1;
        }
        array[j+1] = x
      }
    }
    return array
  }
  
  //MARK: - 希尔排序
  class func shellSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    var dk:Int =  Int(array.count/2)
    while dk >= 1 {
      for i in dk..<array.count {
        if array[i] < array[i-dk] {
          var j = i - dk
          let x = array[i] // 哨兵，即待插入数据
          array[i] = array[i-dk]
          while j >= 0, x < array[j] {//寻找正确的插入位置
            array[j+dk] = array[j]
            j -= dk;
          }
          array[j+dk] = x
        }
      }
      dk = dk/2
    }
    return array
  }

  //选择排序
  class func selectSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    for i in 0 ..< array.count {
      var k = i
      for j in i+1 ..< array.count {
        if array[k] > array[j] { k = j }
      }
      if(k != i){
        let tmp = array[i];  array[i] = array[k]; array[k] = tmp; //最小元素与第i位置元素互换
      }
    }
    return array
  }
  
  //二元选择排序
  
}
