//
//  SecondViewController.swift
//  PItchPerfect
//
//  Created by Luis Santiago  on 10/29/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    var recordedAudioURL: URL?;
    var audioFile : AVAudioFile!;
    var audioEngine : AVAudioEngine!;
    var audioPlayerNode : AVAudioPlayerNode!;
    var stopTimer : Timer!;
    

    let mainStack : UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        stack.alignment = .fill;
        stack.spacing = 35;
        stack.distribution = .fillEqually;
        return stack;
    }();
    
    let snailButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Slow"), for: .normal);
        return button;
    }();
    
    let rabbitButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Fast"), for: .normal);
        return button;
    }();
    
    let squirrelButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "HighPitch"), for: .normal);
        return button;
    }();
    
    let darkVaterButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "LowPitch"), for: .normal);
        return button;
    }();
    
    let birdButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Echo"), for: .normal);
        return button;
    }();
    
    let WeirdButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Reverb"), for: .normal);
        return button;
    }();
    
    let StopButton : UIButton = {
        let button = UIButton();
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setImage(#imageLiteral(resourceName: "Stop"), for: .normal);
        return button;
    }();
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        if recordedAudioURL != nil{
            print(recordedAudioURL!);
        }
        view.addSubview(mainStack);
        setUpStackView();
        setUpLastButton();
    }
    
    func setUpStackView(){
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true;
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
        mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90).isActive = true;
        setUpChildStack();
    }
    
    func setUpChildStack(){
        let firstButtonContainer = UIView();
        firstButtonContainer.addSubview(snailButton);
        
        //Setting the constraints
        snailButton.centerXAnchor.constraint(equalTo: firstButtonContainer.centerXAnchor).isActive = true;
        snailButton.centerYAnchor.constraint(equalTo: firstButtonContainer.centerYAnchor).isActive = true;
        snailButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        let secondButtonContainer = UIView();
        secondButtonContainer.addSubview(rabbitButton);
        
        //Setting constraints
        rabbitButton.centerXAnchor.constraint(equalTo: secondButtonContainer.centerXAnchor).isActive = true;
        rabbitButton.centerYAnchor.constraint(equalTo: secondButtonContainer.centerYAnchor).isActive = true;
        rabbitButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        let thirdButtonContainer = UIView();
        thirdButtonContainer.addSubview(squirrelButton);

        //Constraints
        squirrelButton.centerXAnchor.constraint(equalTo: thirdButtonContainer.centerXAnchor).isActive = true;
        squirrelButton.centerYAnchor.constraint(equalTo: thirdButtonContainer.centerYAnchor).isActive = true;
        squirrelButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        let fourthButtonContainer = UIView();
        fourthButtonContainer.addSubview(darkVaterButton);
        
        //Constraints
        darkVaterButton.centerXAnchor.constraint(equalTo: fourthButtonContainer.centerXAnchor).isActive = true;
        darkVaterButton.centerYAnchor.constraint(equalTo: fourthButtonContainer.centerYAnchor).isActive = true;
        darkVaterButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
   
        /**
         Setting up the last row
         */
        let fithButtonContainer = UIView();
        fithButtonContainer.addSubview(birdButton);
        
        //constraints for buttons
        birdButton.centerXAnchor.constraint(equalTo: fithButtonContainer.centerXAnchor).isActive = true;
        birdButton.centerYAnchor.constraint(equalTo: fithButtonContainer.centerYAnchor).isActive = true;
        birdButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        let sixthButtonContainer = UIView();
        sixthButtonContainer.addSubview(WeirdButton);
        
        //constraints
        WeirdButton.centerXAnchor.constraint(equalTo: sixthButtonContainer.centerXAnchor).isActive = true;
        WeirdButton.centerYAnchor.constraint(equalTo: sixthButtonContainer.centerYAnchor).isActive = true;
        WeirdButton.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        let firstRow = UIStackView(arrangedSubviews: [firstButtonContainer,secondButtonContainer]);
        firstRow.axis = .horizontal;
        firstRow.distribution = .fillEqually;
        firstRow.translatesAutoresizingMaskIntoConstraints = false;
        
        let secondRow = UIStackView(arrangedSubviews: [thirdButtonContainer,fourthButtonContainer]);
        secondRow.axis = .horizontal;
        secondRow.distribution = .fillEqually;
        secondRow.translatesAutoresizingMaskIntoConstraints = false;

   
        let thirdRow = UIStackView(arrangedSubviews: [fithButtonContainer, sixthButtonContainer]);
        thirdRow.axis = .horizontal;
        thirdRow.distribution = .fillEqually;
        thirdRow.translatesAutoresizingMaskIntoConstraints = false;

        mainStack.addArrangedSubview(firstRow);
        mainStack.addArrangedSubview(secondRow);
        mainStack.addArrangedSubview(thirdRow);
        
        firstRow.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor).isActive = true;
        firstRow.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor).isActive = true;
        
        secondRow.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor).isActive = true;
        secondRow.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor).isActive = true;
        
        thirdRow.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor).isActive = true;
        thirdRow.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor).isActive = true;
    }
    
    private func setUpLastButton(){
        view.addSubview(StopButton);
        //constraints;
        StopButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 5).isActive = true;
        StopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        StopButton.heightAnchor.constraint(equalToConstant: 80).isActive = true;
        StopButton.widthAnchor.constraint(equalToConstant: 80).isActive = true;
    }
    
   @objc func stopSound(){
        
    }
}
