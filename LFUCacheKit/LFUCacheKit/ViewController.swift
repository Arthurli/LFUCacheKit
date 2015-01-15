//
//  ViewController.swift
//  LFUCacheKit
//
//  Created by Arthur on 15/1/15.
//  Copyright (c) 2015年 Arthur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var cacheKit:LFUCacheKit! = LFUCacheKit()
        cacheKit.cacheNumber = 5
        cacheKit.setCacheObject("1", cacheKey: "1")
        cacheKit.showDescription()
        cacheKit.setCacheObject("2", cacheKey: "2")
        cacheKit.showDescription()
        cacheKit.setCacheObject("3", cacheKey: "3")
        cacheKit.showDescription()
        cacheKit.cacheWithKey("1")
        cacheKit.showDescription()
        cacheKit.setCacheObject("1", cacheKey: "1")
        cacheKit.showDescription()
        cacheKit.cacheWithKey("2")
        cacheKit.showDescription()
        cacheKit.setCacheObject("4", cacheKey: "4")
        cacheKit.showDescription()
        cacheKit.setCacheObject("5", cacheKey: "5")
        cacheKit.showDescription()
        cacheKit.setCacheObject("1", cacheKey: "1")
        cacheKit.showDescription()
        cacheKit.setCacheObject("6", cacheKey: "6")
        cacheKit.showDescription()
        cacheKit.cacheNumber = 3
        cacheKit.showDescription()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

