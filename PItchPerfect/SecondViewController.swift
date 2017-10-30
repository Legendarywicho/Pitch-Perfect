//
//  SecondViewController.swift
//  PItchPerfect
//
//  Created by Luis Santiago  on 10/29/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var Url: URL?;

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        if Url != nil{
            print(Url!);
        }else{
            print("I dind't got data");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
