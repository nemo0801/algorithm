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
  
}

//MARK: - 插入排序
extension Sequence {
  //MARK: - 直接插入排序
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
}
//MARK: - 选择排序
extension Sequence {
  
  
  //MARK: - 简单的选择排序
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
  
  //MARK: - 二元选择排序
  class func binarySelectSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    for i in 0 ..< array.count/2 {
      var max = i, min = i
      for j in i+1 ... array.count - i - 1 {
        if array[j] > array[max] {
          max = j;continue
        }
        if array[j] < array[min] {
          min = j
        }
      }
      if min == i {
        let tmp = array[array.count - i-1];  array[array.count - i-1] = array[max]; array[max] = tmp;
      } else {
        let tmp = array[array.count-i-1];  array[array.count-i-1] = array[min]; array[min] = tmp;
      }
    }
    return array
  }
  //MARK: - 堆排序
  
  class func heapSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    //初始堆
    buildingHeap(&array)
    //从最后一个元素开始对序列进行调整
    for i in (0..<array.count).reversed() {
      //交换堆顶元素H[0]和堆中最后一个元素
      let temp = array[i]; array[i] = array[0]; array[0] = temp;
      //每次交换堆顶元素和堆中最后一个元素之后，都要对堆进行调整
      var index = 0
      
      heapAdjust(&array, index: &index, length: i)
    }
    return array
  }
  /**
   * 已知H[s…m]除了H[s] 外均满足堆的定义
   * 调整H[s],使其成为大顶堆.即将对第s个结点为根的子树筛选,
   *
   * @param H是待调整的堆数组
   * @param s是待调整的数组元素的位置
   * @param length是数组的长度
   *
   */
  private class func heapAdjust<T>(_ heap: inout [T], index: inout Int, length: Int) where T: Comparable {
    let tmp  = heap[index]
    var child = 2 * index + 1 //左孩子结点的位置。(i+1 为当前调整结点的右孩子结点的位置)
    while (child < length) {
      if(child + 1 < length && heap[child] < heap[child+1]) { // 如果右孩子大于左孩子(找到比当前待调整结点大的孩子结点)
        child += 1
      }
      if(heap[index] < heap[child]) {  // 如果较大的子结点大于父结点
        heap[index] = heap[child] // 那么把较大的子结点往上移动，替换它的父结点
        index = child // 重新设置index ,即待调整的下一个结点的位置
        child = 2 * index + 1
      }  else { // 如果当前待调整结点大于它的左右孩子，则不需要调整，直接退出
        break
      }
      heap[index] = tmp // 当前待调整的结点放到比其大的孩子结点位置上
    }
  }
  /**
   * 初始堆进行调整
   * 将H[0..length-1]建成堆
   * 调整完之后第一个元素是序列的最小的元素
   */
  
  private class func buildingHeap<T>(_ heap: inout [T]) where T: Comparable {
    //最后一个有孩子的节点的位置 i=  (length -1) / 2
    for var i in stride(from: (heap.count - 1) / 2, through: 0, by: -1) {
      heapAdjust(&heap, index: &i, length: heap.count)
    }
  }
}

//MARK: - 交换排序
extension Sequence {
  //MARK: - 冒泡排序
  class func bubbleSort<T>(_ array: inout [T]) -> [T] where T: Comparable {
    for i in 0 ..< array.count {
      for j in 0 ..< array.count - i - 1 {
        if array[j] > array[j+1] {
          let tmp = array[j];  array[j+1] = array[j]; array[j] = tmp;
        }
      }
    }
    return array
  }
  
  //MARK: - 冒泡排序改进版1
  class func bubbleSort1<T>(_ array: inout [T]) -> [T] where T: Comparable {
    for i in 0 ..< array.count {
      for j in 0 ..< array.count - i - 1 {
        if array[j] > array[j+1] {
          let tmp = array[j];  array[j+1] = array[j]; array[j] = tmp;
        } else {
          return array
        }
      }
    }
    return array
  }
  
  //MARK: - 冒泡排序改进版2
  class func bubbleSort2<T>(_ array: inout [T]) -> [T] where T: Comparable {
    var i = array.count - 1 //初始时,最后位置保持不变
    while ( i > 0) {
      var pos = 0 //每趟开始时,无记录交换
      for j in 0 ..< i {
        if array[j] > array[j+1] {
          pos = j; //记录交换的位置
          let tmp = array[j]; array[j]=array[j+1]; array[j+1]=tmp;
        }
        i = pos; //为下一趟排序作准备
      }
    }
    return array
  }
  //MARK: - 冒泡排序改进版3
  class func bubbleSort3<T>(_ array: inout [T]) -> [T] where T: Comparable {
    var low = 0
    var high = array.count - 1 //设置变量的初始值
    
    while (low < high) {
      for j in low ..< high {//正向冒泡,找到最大者
        if (array[j] > array[j+1]) {
          let tmp = array[j]; array[j]=array[j+1]; array[j+1]=tmp;
        }
      }
      for j in (low + 1 ... high).reversed() {//反向冒泡,找到最小者
        if (array[j] < array[j-1]) {
          let tmp = array[j]; array[j]=array[j-1]; array[j-1]=tmp;
          
        }
      }
      high -= 1; //修改high值, 前移一位
      low += 1; //修改low值,后移一位
    }
    return array
  }
  
  
  //MARK: - 快速排序
  
}
