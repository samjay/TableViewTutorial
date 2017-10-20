//
//  RatingControl.swift
//  TableViewTutorial
//
//  Created by general on 20.10.17.
//  Copyright © 2017 general. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize = CGSize(width:44.0, height:44.0)
    {
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: int = 5
    {
        didSet{
            setupButtons()
        }
    }
    
 //MARK Inti
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK button action
    @objc func ratingButtonPress(button: UIButton){
        print("Button pressed")
    }
    
   //MARK Private Methods
    private func setupButtons(){
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonPress(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        
    }
}
