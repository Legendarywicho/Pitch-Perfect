//
//  ViewController.swift
//  PItchPerfect
//
//  Created by Legendary Wicho on 10/3/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var StopRecording: UIButton!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var StopRecordingLabel: UIButton!
    
    @IBAction func onClickRecord(_ sender: Any) {
        RecordingLabel.text = "Recording in progess";
        RecordButton.isEnabled = false;
        StopRecordingLabel.isEnabled = true;
    }
    
    @IBAction func onStop(_ sender: Any) {
        RecordButton.isEnabled = true;
        StopRecordingLabel.isEnabled = false;
        print("We are printing");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        StopRecordingLabel.isEnabled = false;
        // Do nothing for now.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        // disable the recording button
    

    }
    
   
}

