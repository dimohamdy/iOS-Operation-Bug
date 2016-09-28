#  I want to report this bug to prevent other to make this 


![logo](https://raw.githubusercontent.com/dimohamdy/iOS-Operation-Bug/master/image.gif)


 Here I create Operation and add it to Queue

         op = OneShieldOperation {
            while true{
            }
        }
        op.completionBlock = {
            print("FInishn OP")
        }
        operationQueue?.addOperation(op)


Then i try to stop operation and set operation queue with nil 

        op.isFinished = true
        operationQueue?.cancelAllOperations()
        operationQueue = nil
        
Check If Queue is Nil Or Not

        if operationQueue != nil{
            print("operationQueue Live")
        }else{
            print("operationQueue Not Live")
        }

After that i check CPU usage and noticed it's still increate and when press stop in debugger and check thread i found the operation still work



## Author

Ahmed Hamdy, [@dimohamdy](https://twitter.com/dimohamdy)
