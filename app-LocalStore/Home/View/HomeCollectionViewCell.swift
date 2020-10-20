//
//  HomeCollectionViewCell.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit
import Cosmos

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "homeCollectionViewCell"
    
    var location: Location? {
        didSet{
            guard let locationName = location?.name else {return}
            guard let type = location?.type else {return}
            guard let review = location?.review else {return}
            
            nameLabel.text = locationName
            typeLabel.text = type
            starRating.rating = review
            starRating.text = String(review)
        }
    }
    
    var photo: ImageLocation? {
      didSet {
        if let photo = photo {
          imageView.image = photo.image
        }
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setCellShadow()
        
        let stackView = VerticalStackView(arrangedSubviews: [nameLabel, typeLabel, starRating], spacing: 0)
        addSubview(stackView)
        
        stackView.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 20, paddingRight: 8, width: 0, height: 60)
    }
    
    func setup() {
        self.backgroundColor = .white
        self.addSubview(imageView)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 10
    }
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = UIColor.Theme.second
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return image
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Theme.primary
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Theme.label
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    let starRating: CosmosView = {
        var view = CosmosView()
        view.settings.updateOnTouch = false
        view.settings.starSize = 11
        view.settings.textColor = .black
        view.settings.filledImage = UIImage(named: "on")?.withRenderingMode(.alwaysOriginal)
        view.settings.emptyImage = UIImage(named: "off")?.withRenderingMode(.alwaysOriginal)
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

