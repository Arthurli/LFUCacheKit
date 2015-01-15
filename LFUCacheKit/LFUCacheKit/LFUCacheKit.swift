//
//  LFUCacheKit.swift
//  LFUCacheKit
//
//  Created by Arthur on 15/1/15.
//  Copyright (c) 2015年 Arthur. All rights reserved.
//

import UIKit

let defaultCacheNumber = 200

class LFUCacheKit: NSObject {

    class CacheObject : NSObject {
        var cacheObject:AnyObject!
        var cacheKey:String!
        var hit:Int = 1
    }
    
    
    var sortArray : NSMutableArray = NSMutableArray()
    var cachePool : [String : CacheObject] = Dictionary()
    var cacheNumber : Int = defaultCacheNumber {
        
        didSet {
            while self.sortArray.count > cacheNumber {
                var cacheObject:CacheObject = self.sortArray.firstObject as CacheObject
                self.removeCache(cacheObject)
            }
        }
    }
    
    func setCacheObject(cache:AnyObject!, cacheKey:String!) {
        
        if cache == nil || cacheKey == nil {
            return
        }
        
        var cacheObject:CacheObject!
        
        if cachePool[cacheKey] != nil {
            
            cacheObject = cachePool[cacheKey]
            cacheObject.hit++
            
        } else {
            
            cacheObject = CacheObject()
        }
        
        cacheObject.cacheKey = cacheKey
        cacheObject.cacheObject = cache
        
        self.addCache(cacheObject)
        
        if (sortArray.count > cacheNumber) {
          self.removeCache(sortArray.objectAtIndex(0) as LFUCacheKit.CacheObject)
        }
    }
    
    func cacheWithKey(key:String!) -> AnyObject? {
        
        var cacheObject:CacheObject?
        
        if cachePool[key] != nil {
            cacheObject = cachePool[key]
            cacheObject!.hit++
            self.addCache(cacheObject!)
        }
        
        return cacheObject?.cacheObject
    }
    
    func addCache(cacheObject:CacheObject) {
        
        var index:Int = 0
        
        if self.sortArray.containsObject(cacheObject) {
            index = self.sortArray.indexOfObject(cacheObject)
            self.sortArray.removeObject(cacheObject)
        }
        
        var indexCopy = index
        
        for(var i = indexCopy; i < self.sortArray.count; i++) {
            
            var cache:CacheObject = self.sortArray.objectAtIndex(i) as CacheObject
            if cache.hit <= cacheObject.hit {
                index++
            } else {
                break
            }
        }
        
        self.sortArray.insertObject(cacheObject, atIndex: index)
        self.cachePool[cacheObject.cacheKey] = cacheObject
    }
    
    func removeCache(cacheObject:CacheObject) {
        self.sortArray.removeObject(cacheObject)
        self.cachePool[cacheObject.cacheKey] = nil
    }
    
    func showDescription() {
        println("\(self.sortArray.count)")

        for(var i = 0; i < self.sortArray.count; i++) {
            var cache:CacheObject = self.sortArray.objectAtIndex(i) as CacheObject
            print("(\(cache.cacheKey)，\(cache.hit))  ")
        }
        println("\n------")
    }
}
