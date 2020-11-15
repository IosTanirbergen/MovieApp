//
//  Extention + Button.swift
//  MovieApp
//
//  Created by Devnull on 16.11.2020.
//

import UIKit

extension UIButton {
    func setRatingButton(){
    heightAnchor.constraint(equalToConstant: 50).isActive = true
    widthAnchor.constraint(equalToConstant: 50).isActive = true
    layer.cornerRadius = 50 / 2
    //saveButton.layer.masksToBounds = true
    clipsToBounds = true
    setImage(#imageLiteral(resourceName: "Star").withRenderingMode(.alwaysOriginal), for: .normal)
    }
}
