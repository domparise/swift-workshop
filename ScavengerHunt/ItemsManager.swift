//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Dom on 9/4/14.
//  Copyright (c) 2014 dolodev. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = { // find the path to save the archive to and bring the archive from
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryUrls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let archiveURL = documentsDirectoryUrls.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
            items += savedItems
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}