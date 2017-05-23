//
//  RutValidator.swift
//  IMReactiveTextField
//
//  Created by Iván Alejandro Moya Quilodrán on 22-05-17.
//  Copyright © 2017 Iván Alejandro Moya Quilodrán. All rights reserved.
//

import UIKit
import Foundation

enum RutError: Error{
    
    case InvalidRut(message : String)
    
}
class RutValidator: NSObject {
    static func validateRut(value : String) ->Bool {
        //clean rut
        
        
        //        value.replacingOccurrences(of: ".", with: "")
        //        value.replacingOccurrences(of: "-", with: "")
        
        //        var rut = value.stringByReplacingOccurrencesOfString(".", withString: "", options: NSString.CompareOptions.LiteralSearch, range: nil)
        //        rut = rut.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        var rut = value.replacingOccurrences(of: ".", with: "")
        rut = value.replacingOccurrences(of: "-", with: "")
        
        rut =  rut.uppercased()
        //check length
        
        if (rut.characters.count < 8 || rut.characters.count > 9  ) {
            //            throw RutError.InvalidRut(message: "Rut ingresado no válido 1")
            return false
        }
        let rutRegEx = "^(\\d{1,3}(\\.?\\d{3}){2})\\-?([\\dkK])$"
        
        let rutTest = NSPredicate(format:"SELF MATCHES %@", rutRegEx)
        
        if (!rutTest.evaluate(with: rut)) {
            return false
            //            throw RutError.InvalidRut(message: "Rut ingresado no válido 2 ")
        }
        
        let rutToValidate = getRutAndDv(value: rut)
        
        
        let rutWithoutVerifier = rutToValidate.0
        let verifiedDigit = rutToValidate.1
        
        let calculatedVerifiedDigit = getVerifiedDigit(rut: rutWithoutVerifier)
        
        print("calculatedVerifiedDigit \(calculatedVerifiedDigit)")
        
        if (verifiedDigit != calculatedVerifiedDigit) {
            
            //            throw RutError.InvalidRut(message: "Rut ingresado no válido 3 ")
            return false
        }else{
            return true
        }
        
    }
    
    static func getRutAndDv (value : String) -> (String, String) {
        
        if (value.isEmpty || value.characters.count < 2) {
            return ("","")
        }
        
        var rut = value.replacingOccurrences(of: ".", with: "")
        rut = value.replacingOccurrences(of: "-", with: "")
        
        //        var rut = value.stringByReplacingOccurrencesOfString(".", withString: "", options: NSString.CompareOptions.LiteralSearch, range: nil)
        //        rut = rut.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        let verifiedDigit = Array(rut.characters)[rut.characters.count-1]
        let range : Range<String.Index> = rut.startIndex..<rut.index(before: rut.endIndex)
        let rutWithoutVerifiedDigit = rut.substring(with: range)
        
        return (rutWithoutVerifiedDigit, String(verifiedDigit))
    }
    
    static func getVerifiedDigit (rut : String) -> String {
        
        var acumulado : Int = 0
        var ti : Int = 2
        
        for index in stride(from: (rut.characters.count-1), through: 0, by: -1){
            let n = Array(rut.characters)[index]
            let nl = String(n)
            
            guard let vl = Int(nl) else {
                return ""
            }
            
            acumulado += vl * ti
            
            if (ti == 7) {
                ti = 1
            }
            ti += 1
        }
        
        let resto : Int = acumulado % 11
        let numericDigit : Int = 11 - resto
        var digito : String = ""
        
        if (numericDigit <= 9){
            digito = String(numericDigit);
        }else if (numericDigit == 10){
            digito = "K"
        }else{
            digito = "0"
        }
        
        return digito
    }
    
    
}
