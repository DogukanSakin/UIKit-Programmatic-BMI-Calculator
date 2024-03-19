//
//  CustomBottomImage.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 18.03.2024.
//

import UIKit

class CustomBottomImage : UIImageView{
    init() {
        super.init(frame: .zero)
        self.image = UIImage(named: "result_background.png")
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
