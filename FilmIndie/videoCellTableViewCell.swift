//
//  videoCellTableViewCell.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//
// INI BUAT CODING YANG TABLEVIEW

import UIKit

class videoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var labelMovieDirector: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelMovieDuration: UILabel!
    @IBOutlet weak var labelMovieGenre: UILabel!
    @IBOutlet weak var labelMovieSynopsis: UILabel!
    

    func setVideo(video: Video){
        videoImageView.image=video.image
        labelMovieTitle.text=video.title
        labelMovieDirector.text=video.director
        labelMovieDuration.text=video.duration
        labelMovieGenre.text=video.genre
        labelMovieSynopsis.text=video.synopsis
    }
}
