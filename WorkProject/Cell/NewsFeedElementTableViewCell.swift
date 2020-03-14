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
    
 
    //MARK: white space for raiting
    lazy var ScoreView : UIView = {
        var view = UIView()
        view.frame = CGRect(x: 40, y: 40, width: 80, height: 80)
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        view.addSubview(scoreLabel)
        return view
    }()
    

    //MARK: Raiting
    lazy var scoreLabel : UILabel = {
        var label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        label.textColor = .black
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 30)
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
        addSubview(ScoreView)
        backgorundImageView.addSubview(releaseDate)
        
        backgorundImageView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        backgorundImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
        backgorundImageView.rightAnchor.constraint(equalTo: rightAnchor,constant: -10).isActive = true
        backgorundImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        
        
      
            
        releaseDate.bottomAnchor.constraint(equalTo: backgorundImageView.bottomAnchor, constant: 0).isActive = true
        releaseDate.leftAnchor.constraint(equalTo: leftAnchor, constant: 13).isActive = true

     

        
     }
     
    
}










