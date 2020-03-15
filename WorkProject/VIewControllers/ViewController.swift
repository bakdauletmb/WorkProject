//
//  ViewController.swift
//  WorkProject
//
//  Created by Bakdaulet Myrzakerov on 3/12/20.
//  Copyright © 2020 Bakdaulet Myrzakerov. All rights reserved.
//


import UIKit
import SDWebImage


class ViewController: UIViewController, UIScrollViewDelegate{
    
    fileprivate var refresh = UIRefreshControl() //MARK: update data when scrolling down
    fileprivate var fetch = false
    fileprivate var myTableView = UITableView()
    fileprivate let identify = "Cell"
    fileprivate var dataFilms = [FilmJSON]()
    fileprivate var newDataFilms = [FilmJSON]()
    fileprivate var indexPage = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        
        //MARK: set backgroundColor ov vie
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.deepBlue
        view.backgroundColor = .deepBlue
        
        //MARK: set NavigationControllerBar
        navigationController?.navigationBar.barTintColor = .deepBlue
        myTableView.backgroundView = backgroundView
        self.title = "News"
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Georgia", size: 30)!
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        
        
        //MARK: set resfreshing the page
        refresh.tintColor = .white
        myTableView.addSubview(refresh)
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        parse()
    }
    
    //MARK: parses JSON
    func parse()
    {
        let APIKey = "f8630407734038c40bff4871588d2340"
            guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKey)&language=en-US&page=\(indexPage)") else {return}
                if let data = try? Data(contentsOf: url){
                    let decoder = JSONDecoder()
                        if let jsonComeBack = try? decoder.decode(DataFilm.self, from: data){
                            dataFilms = jsonComeBack.results
                            myTableView.reloadData()
                        }
                     }
    }
        
       
        
    //MARK: called when refreshing the page
     @objc func handleRefresh(){
        indexPage = 1
        parse()
        myTableView.reloadData()
        refresh.endRefreshing()
    }
        //MARK: creates UITableView
    fileprivate func createTable(){
        self.myTableView = UITableView(frame: view.frame, style: .plain)
        myTableView.register(NewsFeedElementTableViewCell.self, forCellReuseIdentifier: identify)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        view.addSubview(myTableView)
        }
    // MARK: Infinite scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHight = scrollView.contentSize.height
            if offsetY > contentHight - scrollView.frame.height{
                if !fetch {
                    beginto()
                }
            }
        }
    // MARK: scroll till the end
  fileprivate func beginto(){
        fetch = true
        if indexPage < 999{
            indexPage += 1 }
              let APIKey = "f8630407734038c40bff4871588d2340"
                      guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(APIKey)&language=en-US&page=\(indexPage)") else {return}
                          if let data = try? Data(contentsOf: url){
                              let decoder = JSONDecoder()
                                  if let jsonComeBack = try? decoder.decode(DataFilm.self, from: data){
                                      newDataFilms = jsonComeBack.results
                                      myTableView.reloadData()
                                  }
                               }
            dataFilms+=newDataFilms
            self.myTableView.reloadData()
    
    
            fetch = false
        }
    }


    //MARK: adds custom colors to UIColor
extension UIColor {
    //MARK: function to make color creating easier
    static func rnb(red:CGFloat,green:CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)}
    //MARK: custom colors
    static let deepBlue = rnb(red: 10, green: 29, blue: 49)
    static let textBlue = rnb(red: 148, green: 199, blue: 220)
    }



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! NewsFeedElementTableViewCell
        //MARK: changes the color of pressed icon
        let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = bgColorView
       
        //MARK: background color of cell
        cell.backgroundColor = .deepBlue
        //MARK: passing value from JSON to view of Cell
        cell.releaseDate.text = dataFilms[indexPath.row].release_date
        
        cell.scoreLabel.text = (String(describing:dataFilms[indexPath.row].vote_average!))
        
        //MARK: getting URL
        if let pathToimage = dataFilms[indexPath.row].poster_path{
        
            guard let url = URL(string:  "https://image.tmdb.org/t/p/w300/\(String(describing: pathToimage))")
                else { return cell}
                    //MARK: downloads the image from URL and sets it to cell's image view
                    //MARK: caching happens here, within SDWebImageLibrary
            cell.backgorundImageView.sd_setImage(with: url, completed: nil)}
        else {cell.backgorundImageView.sd_setImage(with: URL(string: "https://i.pinimg.com/474x/96/a0/0d/96a00d42b0ff8f80b7cdf2926a211e47.jpg"), completed: nil)}
        return cell
         }
      
    //MARK: returns amount of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataFilms.count
    }
    //MARK: returns height of cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    //MARK: returns height of header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    //MARK: passes the data to another viewConroller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.deepBlue
        let currentElement = dataFilms[indexPath.row]
        let vc = DetailInfoViewController()
        vc.data = currentElement
        self.navigationController?.pushViewController(vc, animated: true)
    }
      
}


