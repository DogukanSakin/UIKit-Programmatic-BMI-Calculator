//
//  CalculateView.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 4.03.2024.
//

import UIKit

protocol CalculateViewDelegate:AnyObject {
    func calculateBMIButtonTapped(weight: Double, height: Double)
}

class CalculateView:UIView{
    weak var delegate:CalculateViewDelegate?
    
    let heightSlider = CustomSlider(rightHeaderText: "Height", leftHeaderText: "180cm")
    
    let weightSlider = CustomSlider(rightHeaderText: "Weight", leftHeaderText: "80kg")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        let slidersContainer = UIStackView()
        self.addSubview(slidersContainer)
        slidersContainer.addArrangedSubview(heightSlider)
        slidersContainer.addArrangedSubview(weightSlider)
        slidersContainer.axis = .vertical
        slidersContainer.spacing = 30
        
        slidersContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            slidersContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -120),
            slidersContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            slidersContainer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
            
            
        ])
        
    }
    
    
    

}


