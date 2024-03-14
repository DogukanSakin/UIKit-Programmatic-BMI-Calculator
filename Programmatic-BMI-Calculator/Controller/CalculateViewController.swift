//
//  CalculateViewController.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 4.03.2024.
//

import UIKit

class CalculateViewController : UIViewController {

    private var calculateView:CalculateView!
    
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
    func calculateBMIButtonTapped(weight: Double, height: Double) {
        // TODO: Implement calculate func
    }
    
    
}


@available(iOS 17.0, *)
#Preview {
    CalculateViewController()
}
