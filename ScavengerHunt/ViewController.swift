//
//  ViewController.swift
//  ScavengerHunt
//
//  Created by Dom on 9/4/14.
//  Copyright (c) 2014 dolodev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var createdItem: ScavengerHuntItem?
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    createdItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
    
}

