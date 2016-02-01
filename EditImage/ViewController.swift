//
//  ViewController.swift
//  EditImage
//
//  Created by 景娜娜 on 16/1/25.
//  Copyright © 2016年 ysj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var btn : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func goPage(){
     
        self.performSegueWithIdentifier("segue", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var instance = segue.destinationViewController as! editPage
        
    }

}

