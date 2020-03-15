//
//  NewsFeedElementTableViewCell.swift
//  WorkProject
//
//  Created by Bakdaulet Myrzakerov on 3/12/20.
//  Copyright © 2020 Bakdaulet Myrzakerov. All rights reserved.
//

import UIKit

class NewsFeedElementTableViewCell: UITableViewCell {
   
    //MARK: poster
    lazy var backgorundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.8
    return imageView
    }()
    
 

    //MARK: Raiting
    lazy var scoreLabel : UILabel = {
        var label = UILabel(frame: CGRect(x: 30, y: 30, width: 60, height: 60))
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 30)
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 30
        return label
    }()
    //MARK: release date
    lazy var releaseDate: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.textAlignment = .left
        title.numberOfLines = 10
        title.isHighlighted = true
        title.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        title.backgroundColor = .white
        
        return title
    }()

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        setContraints()
        
        
    }

    fileprivate func setContraints() {
   
        addSubview(backgorundImageView)
        addSubview(scoreLabel)
        backgorundImageView.addSubview(releaseDate)
        
        backgorundImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        backgorundImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        backgorundImageView.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        backgorundImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        
        releaseDate.bottomAnchor.constraint(equalTo: backgorundImageView.bottomAnchor, constant: 0).isActive = true
        releaseDate.leftAnchor.constraint(equalTo: leftAnchor, constant: 13).isActive = true

     

        
     }
     
    
}










