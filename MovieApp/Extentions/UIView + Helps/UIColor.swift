//
//  UIColor.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

extension UIColor {
    static func classic() -> UIColor {
        return UIColor(red: 0.6525137424, green: 0.4861608148, blue: 0.5898259282, alpha: 1)
    }
    
    static func blackClassic() -> UIColor {
        return UIColor(red: 0.07491143793, green: 0.1143408492, blue: 0.1482429504, alpha: 1)
    }
    static func example(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


