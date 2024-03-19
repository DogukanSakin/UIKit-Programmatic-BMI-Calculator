//
//  BMIBrain.swift
//  Programmatic-BMI-Calculator
//
//  Created by Doğukan Sakin on 19.03.2024.
//

import Foundation

struct BMIBrain{
    func calculateBMI(_ body:BodyMeasurements)->Float{
        return body.weight / pow(body.height,2)
    }
    
}
