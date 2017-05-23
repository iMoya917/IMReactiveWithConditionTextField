//
//  ValidateConditions.swift
//  ExampleReactiveSwift
//
//  Created by Iván Alejandro Moya Quilodrán on 12-05-17.
//  Copyright © 2017 Iván Alejandro Moya Quilodrán. All rights reserved.
//

import UIKit
class ValidateConditions {
    
    //MARK: emailValidation
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        if(emailAddressString.isEmpty){
            return false
        }
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    //MARK: alphabeticValidation
    func isAlphabetic(textString: String) -> Bool{
        
        if(textString.isEmpty){
            return false
        }
        
        var returnValue = true
        let emailRegEx = "^[A-Za-z]+"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = textString as NSString
            let results = regex.matches(in: textString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue

        
    }
    
    //MARK: alphaNumericValidation
    func isAlphaNumeric(textString: String) -> Bool {
        
        if(textString.isEmpty){
            return false
        }
        
        var returnValue = true
        let emailRegEx = "^[a-zA-Z0-9]+"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = textString as NSString
            let results = regex.matches(in: textString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue

        
    }
    
    //MARK: rutChileValidation
    func isRutChile(textString: String) -> Bool {
        
        if(textString.isEmpty){
            return false
        }

         return RutValidator.validateRut(value: textString)
        
    }
    



}
