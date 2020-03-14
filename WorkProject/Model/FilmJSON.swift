//
//  FilmJSON.swift
//  WorkProject
//
//  Created by Bakdaulet Myrzakerov on 3/12/20.
//  Copyright © 2020 Bakdaulet Myrzakerov. All rights reserved.
//

import Foundation


struct DataFilm : Decodable {
    var results:[FilmJSON]
}
struct FilmJSON: Decodable {
        var release_date:String?
        var poster_path:String?
        var title:String?
        var vote_average:Double?
        var overview:String?
}
