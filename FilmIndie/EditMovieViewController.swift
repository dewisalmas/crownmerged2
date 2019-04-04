//
//  EditMovieViewController.swift
//  FilmIndie
//
//  Created by claudia kenyta on 01/04/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class EditMovieViewController: UIViewController {
    @IBOutlet weak var SynopsisField: UITextField!
    @IBOutlet weak var producerField: UITextField!
    
    @IBOutlet weak var locField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    
    struct GlobalVariable {
        static var globalIndex=0
        static var selectedIndex=0
        static var displayedIndex=0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        genreLabel.text = UserDefaults.standard.string(forKey: "genre")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if GlobalVariable.globalIndex==myLibraryListViewController.GlobalVariable.myLibIndex {
            listHome()
        }
    }
    
    func listHome(){
        titleField.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].title
        SynopsisField.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].synopsis
        producerField.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].director
        yearField.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].year
        locField.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].location
        genreLabel.text=myLibraryListViewController.GlobalVariable.myVideos[GlobalVariable.globalIndex].genre
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
