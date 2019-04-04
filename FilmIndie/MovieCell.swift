//
//  MovieCell.swift
//  CinemaFix
//
//  Created by Fania Cecillia on 29/03/19.
//  Copyright © 2019 Fania Cecillia. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieScreeningDateLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieMinuteLabel: UILabel!
    @IBOutlet weak var movieDirectorLabel: UILabel!
    @IBOutlet weak var movieStartAtLabel: UILabel!
    @IBOutlet weak var movieTheaterLabel: UILabel!
    
    
    func setMovie(movie: Video) {
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieGenreLabel.text = movie.genre
        movieMinuteLabel.text = movie.minute
        movieDirectorLabel.text = movie.director
        movieStartAtLabel.text = movie.startAt
        movieScreeningDateLabel.text = movie.screeningDate
        movieTheaterLabel.text = movie.theater
    }

}
