//
//  CalculateView.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 4.03.2024.
//

import UIKit

protocol CalculateViewDelegate:AnyObject {
    func calculateBMIButtonTapped(weight: Float, height: Float)
}

class CalculateView:UIView{
    weak var delegate:CalculateViewDelegate?
    
    // MARK: - Custom Components
    
    let heightSlider = CustomSlider(header:"Height" ,suffix: "m",minimumValue: 1,maximumValue: 3)
    let weightSlider = CustomSlider(header: "Weight",suffix: "kg",minimumValue: 30,maximumValue: 200,convertValueLabelToInt: true)
    let calculateButton = CustomButton(title: "Calculate")
    let bottomImage = CustomBottomImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupViews(){
        let slidersContainer = UIStackView()
        
        self.addSubview(slidersContainer)
        self.addSubview(bottomImage)
        self.addSubview(header)
        
        slidersContainer.addArrangedSubview(heightSlider)
        slidersContainer.addArrangedSubview(weightSlider)
        slidersContainer.addArrangedSubview(calculateButton)
        slidersContainer.axis = .vertical
        slidersContainer.spacing = 30
        
        slidersContainer.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.action = calculateButtonTapped
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 40),
            header.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            header.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            slidersContainer.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor),
            slidersContainer.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
            slidersContainer.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor,constant: 20),
            slidersContainer.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -20),
            bottomImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomImage.leadingAnchor.constraint(equalTo: self.leadingAnchor)
           
        ])
        
    }
    
    // MARK: - Header
    
    private let header:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calculate Your BMI"
        label.textColor = UIColor(named: "Secondary")
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private func calculateButtonTapped() {
        delegate?.calculateBMIButtonTapped(weight: weightSlider.sliderValue, height: heightSlider.sliderValue)
    }
     

}


@available(iOS 17.0, *)
#Preview {
    CalculateView(frame:.zero)
}

