//
//  MovieDetailViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

    class MovieDetailViewController: UIViewController {
        
        struct GlobalVariable {
     
          static var globalIndex=0
            static var selectedIndex=0
            static var displayedIndex=0
        }
        
        @IBOutlet weak var movieImageView: UIImageView!
        @IBOutlet weak var labelMovieTitle: UILabel!
        @IBOutlet weak var labelMovieGenre: UILabel!
        @IBOutlet weak var labelMovieDuration: UILabel!
        @IBOutlet weak var labelMovieDirector: UILabel!
        @IBOutlet weak var labelMovieYear: UILabel!
        @IBOutlet weak var labelMovieLocation: UILabel!
        @IBOutlet weak var labelMovieDatePublish: UILabel!
        @IBOutlet weak var labelMovieNumVote: UILabel!
        @IBOutlet weak var labelMoviePublisher: UILabel!
        @IBOutlet weak var labelMovieSynopsis: UILabel!
        @IBOutlet weak var moviePoster: UIImageView!
        @IBOutlet weak var btnSwitchVote: UISwitch!
        @IBOutlet weak var labelVote: UILabel!
        
        var tempvote:Int=0
        /*override func viewDidLoad() {
        super.viewDidLoad()*/
        override func viewWillAppear(_ animated: Bool) {
            
            super.viewWillAppear(animated)
            
            if GlobalVariable.globalIndex==homeListSreenViewController.GlobalVariable.myIndex{
                
                listHome()
                
            }else if GlobalVariable.globalIndex==votedListScreenViewController.GlobalVariable.voteIndex{
                
                listVoted()
                
            }
            
    }
        
        func listHome(){
            labelMovieTitle.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].title
            movieImageView.image=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].image
            
            labelMovieGenre.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].genre
            
            labelMovieDuration.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].duration
            
            labelMovieDirector.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].director
            
            labelMovieSynopsis.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].synopsis
            
            labelMovieYear.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].year
            
            labelMovieLocation.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].location
            
            labelMovieDatePublish.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].publishedDate
            
            labelMovieNumVote.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].totvote.description
            
            labelMoviePublisher.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].publisher
            
            moviePoster.image=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].poster
            
            if
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.globalIndex].vote==false{
                btnSwitchVote.isOn=false
                labelVote.text="Vote"
            }else{
                btnSwitchVote.isOn=true
                labelVote.text="Unvote"
            }
        }
        
        func listVoted(){
            labelMovieTitle.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].title
            movieImageView.image=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].image
            
            labelMovieGenre.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].genre
            
            labelMovieDuration.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].duration
            
            labelMovieDirector.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].director
            
            labelMovieSynopsis.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].synopsis
            
            labelMovieYear.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].year
            
            labelMovieLocation.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].location
            
            labelMovieDatePublish.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].publishedDate
            
            labelMovieNumVote.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].totvote.description
            
            labelMoviePublisher.text=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].publisher
            
            moviePoster.image=votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].poster
            
            if
                votedListScreenViewController.GlobalVariable.voteVideo[GlobalVariable.globalIndex].vote==false{
                btnSwitchVote.isOn=false
                labelVote.text="Vote"
            }else{
                btnSwitchVote.isOn=true
                labelVote.text="Unvote"
            }
        }
    
        
        @IBAction func switchVote(_ sender: UISwitch) {
            if GlobalVariable.globalIndex==homeListSreenViewController.GlobalVariable.myIndex{
                GlobalVariable.displayedIndex=homeListSreenViewController.GlobalVariable.myIndex
                
                actvote()
                
            }else if GlobalVariable.globalIndex==votedListScreenViewController.GlobalVariable.voteIndex{
                
                for i in 0..<homeListSreenViewController.GlobalVariable.videos.count-1{
                    if votedListScreenViewController.GlobalVariable.voteVideo[votedListScreenViewController.GlobalVariable.voteIndex].title==homeListSreenViewController.GlobalVariable.videos[i].title
                    {
                     GlobalVariable.displayedIndex=i
                    }
                                   }
                
                actvote()
            }
        }
        
        
        func actvote(){
            if
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].vote==false{
                tempvote=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote+1
                
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].vote=true
                
                btnSwitchVote.isOn=true
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote=tempvote
                
                labelMovieNumVote.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote.description
                
                labelVote.text="Unvote"
            }else{
                tempvote=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote-1
                
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].vote=false
                
                btnSwitchVote.isOn=false
                homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote=tempvote
                
                labelMovieNumVote.text=homeListSreenViewController.GlobalVariable.videos[GlobalVariable.displayedIndex].totvote.description
                
                labelVote.text="Vote"
            }
            
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
