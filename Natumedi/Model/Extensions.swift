//
//  Extensions.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import Foundation

extension DateComponentsFormatter {
    
    static let abbreviated: DateComponentsFormatter = {
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
        
    }()
    
    static let positional: DateComponentsFormatter = {
        
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
        
    }()
    
}
