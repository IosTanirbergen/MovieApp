//
//  HomePageViewController.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

struct saveData {
    static let title = ""
    static let descriptions = ""
    static let image = ""
}

class HomePageViewController: UIViewController {
    var data: Results?
    let ratingContainer = UIView()
    
    var movieImages: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = .white
        return label
    }()
    
    var movieData: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.backgroundColor = .white
        return label
    }()
    
    lazy var stackTitle: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            titleLabel,
            movieData
        ])
        sv.axis = .vertical
        sv.spacing = 5
        return sv
    }()
    
    let ratingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let descriptions: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleSaveData), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blackClassic()
        view.addSubview(movieImages)
        self.movieImages.contentMode = .scaleToFill
        movieImages.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 60, left: 0, bottom: 0, right: 0))
        movieImages.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.4).isActive = true
        movieImages.animationDuration = 0
        movieImages.animationRepeatCount = 1
        movieImages.startAnimating()
        movieImages.setupContainerLayer()
                
        view.addSubview(stackTitle)
        stackTitle.anchor(top: nil, leading: view.leadingAnchor, bottom: movieImages.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 20, bottom: 15, right: 0))
        
        view.addSubview(descriptions)
        descriptions.anchor(top: movieImages.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 20, left: 15, bottom: 0, right: 16))
        
        view.addSubview(ratingContainer)
        ratingContainer.anchor(top: movieImages.topAnchor, leading: movieImages.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 40, left: 25, bottom: 0, right: 0))
        ratingContainer.setupRatingContainer()
        
        ratingContainer.addSubview(ratingLabel)
        ratingLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        ratingLabel.centerXAnchor.constraint(equalTo: ratingContainer.centerXAnchor).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo:ratingContainer.centerYAnchor).isActive = true
        
        view.addSubview(saveButton)
        saveButton.setRatingButton()
        saveButton.anchor(top: ratingContainer.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 15))
        saveButton.setupShadow(color: UIColor.white, opacity: 2, offSet: CGSize(width: 1, height: -1), radius: 3, scale: false)
    }
    @objc fileprivate func handleSaveData(){
        let defaults = UserDefaults.standard
        defaults.setValue(titleLabel.text, forKey: saveData.title)
        defaults.setValue(descriptions.text, forKey: saveData.descriptions)
       // defaults.setValue(movieImages.image, forKey: saveData.image)
        let vc = SaveDataViewController()
        self.present(vc,animated: true)
    }
}
