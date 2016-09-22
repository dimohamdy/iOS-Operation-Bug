//
//  ViewController.swift
//  OperationBug
//
//  Created by BinaryBoy on 9/22/16.
//  Copyright © 2016 BinaryBoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var  operationQueue:OperationQueue? = OperationQueue()
    var op:OneShieldOperation!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         op = OneShieldOperation {
            while true{
                
            }
        }
        op.completionBlock = {
            print("FInishn OP")
        }
        operationQueue?.addOperation(op)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cacelOp(_ sender: AnyObject) {
        op.isFinished = true
        operationQueue?.cancelAllOperations()
        operationQueue = nil
        
        if operationQueue != nil{
            print("operationQueue Live")
        }
    }

}
open class OneShieldOperation:BlockOperation {
    
    private var _executing: Bool = false
    override open var isExecuting: Bool {
        get {
            return _executing
        }
        set {
            if _executing != newValue {
                willChangeValue(forKey: "isExecuting")
                _executing = newValue
                didChangeValue(forKey: "isExecuting")
            }
        }
    }
    
    private var _finished: Bool = false;
    override open var isFinished: Bool {
        get {
            return _finished
        }
        set {
            if _finished != newValue {
                willChangeValue(forKey: "isFinished")
                _finished = newValue
                didChangeValue(forKey: "isFinished")
                self.cancel()
            }
        }
    }
    
}
