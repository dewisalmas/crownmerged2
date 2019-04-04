//
//  myMovieDetailViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 02/04/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class myMovieDetailViewController: UIViewController {
    
    struct globalVariable {
        static var globalIndex=0
    }

    @IBOutlet weak var myMovieImageView: UIImageView!
    @IBOutlet weak var labelMyMovieTitle: UILabel!
    @IBOutlet weak var labelMyMovieGenre: UILabel!
    @IBOutlet weak var labelMyMovieDuration: UILabel!
    @IBOutlet weak var labelMyMovieDirector: UILabel!
    @IBOutlet weak var labelMyMovieYear: UILabel!
    @IBOutlet weak var labelMyMovieLocation: UILabel!
    @IBOutlet weak var labelMyMovieDatePublish: UILabel!
    @IBOutlet weak var labelMyMovieNumVote: UILabel!
    @IBOutlet weak var labelMyMoviePublisher: UILabel!
    @IBOutlet weak var labelMyMovieSynopsis: UILabel!
    @IBOutlet weak var myMoviePoster: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        labelMyMovieTitle.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].title
        myMovieImageView.image=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].image
        labelMyMovieGenre.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].genre
        labelMyMovieDuration.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].duration
        
        labelMyMovieDirector.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].director
        
        labelMyMovieSynopsis.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].synopsis
        
        labelMyMovieYear.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].year
        
        labelMyMovieLocation.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].location
        
        labelMyMovieDatePublish.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].publishedDate
        
        labelMyMovieNumVote.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].totvote.description
        
        labelMyMoviePublisher.text=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].publisher
        
        myMoviePoster.image=myLibraryListViewController.GlobalVariable.myVideos[myLibraryListViewController.GlobalVariable.myLibIndex].poster
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
