//
//  ViewController.swift
//  algorithm
//
//  Created by xiangyu on 2017/5/8.
//  Copyright © 2017年 xiangyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    var array = [3,4,1,9,7,3,2,4,2,6]
    print(Sequence.insertSort(&array))
    print(Sequence.shellSort(&array))
    print(Sequence.selectSort(&array))
    print(Sequence.binarySelectSort(&array))
    print(Sequence.heapSort(&array))
    print(Sequence.bubbleSort(&array))
    print(Sequence.bubbleSort1(&array))
    print(Sequence.bubbleSort2(&array))
    print(Sequence.bubbleSort3(&array))
    print(Sequence.quick_sort(&array))
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

