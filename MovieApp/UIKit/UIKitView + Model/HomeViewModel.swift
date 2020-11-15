//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

class HomeViewModel {
    // var movieModel = []() = nil
    let poster_path : String?
    let id : Int?
    let original_title : String?
    let title : String?
    let vote_average : Double?
    let overview : String?
    let release_date : String?
    let backdrop_path : String?
    
    init(movie: Results) {
        self.poster_path = movie.poster_path
        self.id = movie.id
        self.original_title = movie.original_title
        self.title = movie.title
        self.vote_average = movie.vote_average
        self.overview = movie.overview
        self.release_date = movie.release_date
        self.backdrop_path = movie.backdrop_path
    }
}
