//
//  ViewController.swift
//  PItchPerfect
//
//  Created by Legendary Wicho on 10/3/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let recordButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "RecordButton"), for: .normal);
        button.addTarget(self, action: #selector(onClickRecord), for: .touchUpInside);
        return button;
    }();
    
    let textStatus : UITextView = {
        let textView = UITextView();
        textView.text = "Tap to record";
        textView.translatesAutoresizingMaskIntoConstraints = false;
        textView.isEditable = false;
        textView.isScrollEnabled = false;
        textView.textAlignment = .center;
        textView.font = UIFont.systemFont(ofSize : 20);
        return textView;
    }();
    
    let stopRecordButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Stop"), for: .normal);
        button.addTarget(self, action: #selector(onStopClick), for: .touchUpInside);
        button.isEnabled = false;
        return button;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.title = "Pitch perfect";
        view.backgroundColor = .white;
        view.addSubview(recordButton);
        view.addSubview(textStatus);
        view.addSubview(stopRecordButton);
        setUpLayout();
    }
    
    func setUpLayout(){
        
        //Layout for recording button
        recordButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 100).isActive = true;
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        recordButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        //Layout for textview
        textStatus.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant : -15).isActive = true;
        textStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
        textStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
        
        //Stop button
        stopRecordButton.topAnchor.constraint(equalTo: textStatus.bottomAnchor).isActive = true;
        stopRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        stopRecordButton.widthAnchor.constraint(equalToConstant: 80).isActive = true;
        stopRecordButton.heightAnchor.constraint(equalToConstant: 80).isActive = true;
    }
    
    @objc func onClickRecord(){
        navigationController?.pushViewController(SecondViewController(), animated: true);
        /*textStatus.text = "Recording";
        recordButton.isEnabled = false;
        stopRecordButton.isEnabled = true;*/
    }
    
    @objc func onStopClick(){
//        textStatus.text = "Click to record";
//        recordButton.isEnabled = true;
//        stopRecordButton.isEnabled = false;
    }
}

