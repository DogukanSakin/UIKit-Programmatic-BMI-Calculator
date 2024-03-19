//
//  CalculateViewController.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 4.03.2024.
//

import UIKit

class CalculateViewController : UIViewController {

    private var calculateView:CalculateView!
    private let bmiBrain = BMIBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalculateView()
        view.backgroundColor = .white
     
    }
    
    private func setupCalculateView(){
        calculateView = CalculateView(frame: view.bounds)
        calculateView.delegate = self
        view.addSubview(calculateView)

    }

}

extension CalculateViewController : CalculateViewDelegate {
    func calculateBMIButtonTapped(weight: Float, height: Float) {
        let measurements = BodyMeasurements(height: height, weight: weight)
        
        let bmiResult = bmiBrain.calculateBMI(measurements)
        
        
        let resultScreen = ResultViewController()
        resultScreen.bmiResult = bmiResult
        navigationController?.pushViewController(resultScreen, animated: true)
    }
    
}


@available(iOS 17.0, *)
#Preview {
    CalculateViewController()
}
