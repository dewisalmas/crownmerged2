//
//  CMovieDetailController.swift
//  CinemaFix
//
//  Created by Fania Cecillia on 30/03/19.
//  Copyright © 2019 Fania Cecillia. All rights reserved.
//

import UIKit

class CMovieDetailController: UIViewController {

    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieDurationLabel: UILabel!
    @IBOutlet weak var movieDirectionLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieLocationLabel: UILabel!
    @IBOutlet weak var movieTotvoteLabel: UILabel!
    @IBOutlet weak var moviePublisherLabel: UILabel!
    @IBOutlet weak var moviePublishedDateLabel: UILabel!
    @IBOutlet weak var movieSynopsisLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviePosterView.image = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].poster
        
         movieImageView.image = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].image
        
         movieTitleLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].title
        
         movieGenreLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].genre
        
        movieDurationLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].duration
        
        movieYearLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].year
        
        movieLocationLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].location
        
        movieTotvoteLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].totvote.description
        
        moviePublisherLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].publisher
        
        moviePublishedDateLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].publishedDate
        
        movieSynopsisLabel.text = CinemaController.PublicVar.movies[CinemaController.PublicVar.myIndex].synopsis

    }
    
}
