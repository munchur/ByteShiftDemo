//
//  DurationIncentiveViewController.swift
//  ByteShiftDemo
//
//  Created by Cher Moua on 7/21/17.
//  Copyright © 2017 ByteShift. All rights reserved.
//

import UIKit

class DurationIncentiveViewController: UIViewController {

    @IBOutlet weak var timerLable: UILabel!
    var seconds = 0;
    var timer = Timer();
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DurationIncentiveViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer(){
        seconds += 1;
        timerLable.text = "\(seconds)" + " Seconds";
    }
    
    func stopTimer(){
        timer.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLable.text = "\(seconds)" + " Seconds";
        startTimer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
