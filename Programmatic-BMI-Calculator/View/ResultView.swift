//
//  ResultView.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 19.03.2024.
//

import UIKit

protocol ResultViewDelegate:AnyObject {
    func reCalculateButtonTapped()
 
}


class ResultView:UIView{
    weak var delegate:ResultViewDelegate?
    var bmiResult:Float?
    
    let bottomImage = CustomBottomImage()
    let recalculateButton = CustomButton(title: "Recalculate",backgroundColor: .white,titleColor: UIColor(named: "Main"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(bottomImage)
        self.addSubview(resultLabel)
        self.addSubview(headerLabel)
        self.addSubview(recalculateButton)
        
        recalculateButton.action = reCalculateButtonTapped
        
        NSLayoutConstraint.activate([
            bottomImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            resultLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            recalculateButton.topAnchor.constraint(equalTo:resultLabel.bottomAnchor,constant: 40),
            recalculateButton.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200)

        ])
    }
    

    // MARK: - Header Label
    
    private let headerLabel:UILabel = {
        let label = UILabel()
        label.text = "YOUR RESULT"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: - Result Label
    
    private let resultLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        label.text = "20"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    func updateResultLabel(with bmiResult: Float?) {
        self.bmiResult = bmiResult
        resultLabel.text = "\(String(format:"%.2f",bmiResult ?? 0.0))"
    }
    
    private func reCalculateButtonTapped() {
        delegate?.reCalculateButtonTapped()
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ResultView()
}

