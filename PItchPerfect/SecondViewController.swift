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

    let mainStack : UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight];
        return stack;
    }();
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        if Url != nil{
            print(Url!);
        }
        view.addSubview(mainStack);
        setUpStackView();
    }
    
    func setUpStackView(){
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true;
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
        mainStack.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true;
        setUpChildStack();
    }
    
    func setUpChildStack(){
        let firstButton = UIView();
        firstButton.backgroundColor = .blue;
        
        let secondButton = UIView();
        secondButton.backgroundColor = .green;
        
        
        let thirdButton = UIView();
        thirdButton.backgroundColor = .red;
        
        let fourthButton = UIView();
        fourthButton.backgroundColor = .orange;
        
        let fifthButton = UIView();
        fifthButton.backgroundColor = .yellow;
        let fifthbutton = UIView();
        
        let firstRow = UIStackView(arrangedSubviews: [firstButton,secondButton]);
        firstRow.axis = .horizontal;
        firstRow.distribution = .fillEqually;
        firstRow.translatesAutoresizingMaskIntoConstraints = false;
        
        let secondRow = UIStackView(arrangedSubviews: [thirdButton,fourthButton]);
        secondRow.axis = .horizontal;
        secondRow.distribution = .fillEqually;
        secondRow.translatesAutoresizingMaskIntoConstraints = false;

        
        mainStack.addArrangedSubview(firstRow);
        mainStack.addArrangedSubview(secondRow);
        
        firstRow.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor).isActive = true;
        firstRow.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor).isActive = true;
        firstRow.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        secondRow.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor).isActive = true;
        secondRow.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor).isActive = true;
        secondRow.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
    }
}
