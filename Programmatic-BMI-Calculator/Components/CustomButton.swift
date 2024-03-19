//
//  CustomButton.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 18.03.2024.
//

import UIKit

class CustomButton:UIButton {
    
    var action:(()->Void)?
    
    init(title: String,backgroundColor:UIColor? = UIColor(named: "Secondary"),titleColor:UIColor? = .white) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.layer.cornerRadius = 10
        self.configuration = .filled()
        self.configuration?.baseBackgroundColor = backgroundColor!
        self.setTitleColor(titleColor, for: .normal)
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
        self.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPress(){
        if let safeAction = action {
            safeAction()
        }
    }
}
