//
//  UIImageExtention.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imgURL: String){
        self.kf.setImage(with: URL(string: imgURL))
    }
}

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}

extension UIView {
    func setupContainerLayer(){
    backgroundColor = UIColor.blackClassic()
    layer.shadowColor = UIColor.white.cgColor
    layer.shadowOpacity = 1
    layer.cornerRadius = 15
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 5
        
    }
    
    func setupRatingLayer(){
        backgroundColor = UIColor.white
        let height = 100
        let width = 100
        frame.size = CGSize(width: width, height: height)
//        layer.cornerRadius = frame.size.height / 2
//        clipsToBounds = true
    }
    
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)

    }
}

extension UIView {
    func setupRatingContainer(){
        let width: CGFloat = 50
        backgroundColor = .white
        heightAnchor.constraint(equalToConstant: width).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        layer.cornerRadius = width / 2
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
