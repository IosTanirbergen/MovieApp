//
//  SaveDataViewController.swift
//  MovieApp
//
//  Created by Devnull on 16.11.2020.
//

import UIKit

class SaveDataViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var movieImages: UIImageView = {
        let img = UIImageView()
        return img
    }()

    let descriptions: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptions
        ])
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackClassic()
        view.addSubview(stackView)
        stackView.setupContainerLayer()
        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 25, left: 25, bottom: 0, right: 25))
        
        let defaults = UserDefaults.standard
        titleLabel.text = defaults.string(forKey: saveData.title)
        descriptions.text = defaults.string(forKey: saveData.descriptions)
        
        
        
    }

}
