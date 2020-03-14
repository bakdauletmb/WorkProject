//
//  DetailInfoViewController.swift
//  WorkProject
//
//  Created by Bakdaulet Myrzakerov on 3/13/20.
//  Copyright © 2020 Bakdaulet Myrzakerov. All rights reserved.
//

import UIKit


//MARK: this ViewController opens when you touch a cell

class DetailInfoViewController: UIViewController {
    
    //MARK: scroll view
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 1000
        return scrollView
    }()
    
    
    //MARK: Moview poster
    lazy var imageView : UIImageView =
    {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.addSubview(raiting)
        return imageView
        
    }()
    var nameOfMovie : UILabel = {
        var nameOfMovie = UILabel()
        
        nameOfMovie.textColor = .white
        nameOfMovie.font = UIFont.boldSystemFont(ofSize: 24)
        nameOfMovie.translatesAutoresizingMaskIntoConstraints = false
        nameOfMovie.numberOfLines = 4
        return nameOfMovie
    }()
    //MARK: data from JSON
    var data:FilmJSON?
    {
        didSet{
            overview.text = data?.overview
            raitingString.text = data?.vote_average?.description
            nameOfMovie.text = data?.title
            if let name = data?.poster_path{
                let url = URL(string: "http://image.tmdb.org/t/p/w342/\(name)")
                    do{ let data = try Data(contentsOf: url!)
                        imageView.image = UIImage(data: data)}
                    catch{
                        print(error)}
            }
        }
    }
    
    //MARK: description of movie
    var overview: UILabel = {
        
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = .textBlue
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
        label.numberOfLines = 9
    return label
    }()
    //MARK: raiting view
    lazy var raiting: UIView = {
        var raiting =  UIView()
        raiting.translatesAutoresizingMaskIntoConstraints = false
        raiting.backgroundColor = .white
        raiting.layer.cornerRadius = 35
        raiting.addSubview(raitingString)
    return raiting
     }()
    //MARK: raiting value
    var raitingString:UILabel = {
        var raitingString = UILabel()
        raitingString.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 24)
        raitingString.textColor = .black
        raitingString.translatesAutoresizingMaskIntoConstraints = false
    return raitingString
    }()
    //MARK: release date
    var releaseDate:UILabel = {
        var releaseData = UILabel()
        releaseData.font = UIFont.boldSystemFont(ofSize: 20)
        releaseData.textColor = .textBlue
        releaseData.text = "22.222.22"
        releaseData.translatesAutoresizingMaskIntoConstraints = false
    return releaseData
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setContraints()
        
        self.title = nameOfMovie.text
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        tlabel.text = self.title
        tlabel.textColor = UIColor.white
        tlabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.numberOfLines = 3
        tlabel.textAlignment = .center
        self.navigationItem.titleView = tlabel
        
    }
 
    

    
    fileprivate func setContraints() {
        
        view.addSubview(releaseDate)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        view.backgroundColor = .deepBlue
        scrollView.addSubview(overview)
        scrollView.addSubview(nameOfMovie)
        //MARK:  Release date
        releaseDate.topAnchor.constraint(equalTo: nameOfMovie.bottomAnchor,constant: 2).isActive = true
        releaseDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        releaseDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
      
        //MARK:  Scroll view
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //MARK:  MOVIE TITLE
        nameOfMovie.topAnchor.constraint(equalTo:imageView.bottomAnchor , constant: 5).isActive = true
        nameOfMovie.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        nameOfMovie.widthAnchor.constraint(equalToConstant: 220).isActive = true
        
        
        
        //MARK:  POSTER
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:  40).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        //MARK:  DESCRIPTION
        overview.topAnchor.constraint(equalTo: releaseDate.bottomAnchor,constant: 10).isActive = true
        overview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        overview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        
        
        //MARK: RAITING VIEW
        raiting.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 30 ).isActive = true
        raiting.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 20).isActive = true
        raiting.heightAnchor.constraint(equalToConstant: 70).isActive = true
        raiting.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        //MARK: RAITING VALUE
        raitingString.centerYAnchor.constraint(equalTo: raiting.centerYAnchor).isActive = true
        raitingString.centerXAnchor.constraint(equalTo: raiting.centerXAnchor,constant: 10).isActive = true
        raitingString.heightAnchor.constraint(equalToConstant: 60).isActive = true
        raitingString.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }

    
    
}
