//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    fileprivate let width: CGFloat = 50
    var totalPage = 1
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let movieData: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackDataLabel: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            titleLabel,
            movieData
        ])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    let imageContainer = UIView()
    
    let ratingContainer = UIView()
    
    let ratingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let imageMovie: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.isEnabled = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupSubviews()
         backgroundColor = UIColor.blackClassic()
        
         DispatchQueue.main.async {
          self.imageMovie.layer.cornerRadius = 18
          self.imageMovie.clipsToBounds = true
        }
     }
    
    fileprivate func setupSubviews(){
        addSubview(imageContainer)
        imageContainer.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        imageContainer.setupContainerLayer()
        imageContainer.addSubview(imageMovie)
        imageMovie.alpha = 0.5
        imageMovie.anchor(top: imageContainer.topAnchor, leading: imageContainer.leadingAnchor, bottom: imageContainer.bottomAnchor, trailing: imageContainer.trailingAnchor)
       // imageView?.fillSuperview()
        imageContainer.addSubview(stackDataLabel)
        stackDataLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 15, bottom: 0, right: 15))
        stackDataLabel.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
        
        imageContainer.addSubview(ratingContainer)
        ratingContainer.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 19, left: 25, bottom: 0, right: 0))
        ratingContainer.setupRatingContainer()
        ratingContainer.addSubview(ratingLabel)
        ratingLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        ratingLabel.centerXAnchor.constraint(equalTo: ratingContainer.centerXAnchor).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo:ratingContainer.centerYAnchor).isActive = true
        
        addSubview(saveButton)
        saveButton.setRatingButton()
        saveButton.anchor(top: ratingContainer.topAnchor, leading: nil, bottom: nil, trailing: imageContainer.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 15))
        saveButton.setupShadow(color: UIColor.white, opacity: 2, offSet: CGSize(width: 1, height: -1), radius: 3, scale: false)
        // saveButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            backgroundColor = UIColor.classic()
        } else {
            backgroundColor = UIColor.blackClassic()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("MovieTableViewCell... err")
    }

    
    @objc fileprivate func refreshData(){
        print("1")
    }
}
