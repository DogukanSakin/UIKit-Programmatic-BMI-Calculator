//
//  CustomSlider.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 14.03.2024.
//

import UIKit

class CustomSlider : UIStackView {
    var rightHeaderText:String = ""
    var leftHeaderText:String = ""
    
    private let slider = UISlider()
    private let leftHeader = UILabel()
    private let rightHeader = UILabel()
    private let headerStackView = UIStackView()
    
    init(rightHeaderText: String, leftHeaderText: String) {
        super.init(frame: .zero)
        self.rightHeaderText = rightHeaderText
        self.leftHeaderText = leftHeaderText
        
        // Container
        self.addArrangedSubview(headerStackView)
        self.addArrangedSubview(slider)
        self.axis = .vertical
        self.spacing = 20
        
        // Header
        self.leftHeader.text = leftHeaderText
        self.rightHeader.text = rightHeaderText
        self.rightHeader.textAlignment = .right
        self.headerStackView.addArrangedSubview(leftHeader)
        self.headerStackView.addArrangedSubview(rightHeader)
        self.headerStackView.distribution = .fillEqually
        
        // Slider
        self.slider.thumbTintColor = UIColor(named: "Main")
        self.slider.tintColor = .systemGray
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
    

    

    
}


