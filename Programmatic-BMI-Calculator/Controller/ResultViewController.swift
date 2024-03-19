//
//  ResultViewController.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 19.03.2024.
//

import UIKit

class ResultViewController:UIViewController{
    private var resultView:ResultView!
    var bmiResult:Float? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalculateView()
   
 
    }
    
    private func setupCalculateView(){
        resultView = ResultView(frame: view.bounds)
        resultView.delegate = self
        
        resultView.updateResultLabel(with: bmiResult)
    
        switch bmiResult! {
        case 0...18.5:
            view.backgroundColor = .systemPurple
        case 18.5...24.99:
            view.backgroundColor = .systemGreen
        case 25...29.99:
            view.backgroundColor = .systemOrange
        default:
            view.backgroundColor = .systemRed
        }
        view.addSubview(resultView)
        

    }
    
}

extension ResultViewController:ResultViewDelegate{

    func reCalculateButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

@available(iOS 17.0, *)
#Preview {
    ResultViewController()
}

