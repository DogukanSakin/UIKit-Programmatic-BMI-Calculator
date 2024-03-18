//
//  CustomSlider.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 14.03.2024.
//

import UIKit

class CustomSlider : UIStackView {
    weak var delegate: CalculateViewDelegate?
    var suffix:String = ""
    
    private let slider = UISlider()
    private let headerLabel = UILabel()
    private let valueLabel = UILabel()
    private let headerStackView = UIStackView()
    
    var sliderValue:Float {
        get{
            return self.slider.value
        }
    }
    
    init(header: String,suffix:String,minimumValue:Float,maximumValue:Float) {
        super.init(frame: .zero)
        self.suffix = suffix
        
        // Container
        self.addArrangedSubview(headerStackView)
        self.addArrangedSubview(slider)
        self.axis = .vertical
        self.spacing = 20
        
        // Header
        self.headerLabel.text = header
        self.valueLabel.text = "\(String(Int(minimumValue)) + suffix)"
        self.valueLabel.textAlignment = .right
        self.headerStackView.addArrangedSubview(headerLabel)
        self.headerStackView.addArrangedSubview(valueLabel)
        self.headerStackView.distribution = .fillEqually
        
        // Slider
        self.slider.thumbTintColor = UIColor(named: "Main")
        self.slider.tintColor = .systemGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        self.slider.minimumValue = minimumValue
        self.slider.maximumValue = maximumValue

        
    }
    
    @objc private func sliderValueChanged(_ sender:UISlider){
        self.valueLabel.text = "\(String(Int(self.sliderValue)) + suffix)"
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
  
}


