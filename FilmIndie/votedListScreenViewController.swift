//
//  votedListScreenViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 29/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class votedListScreenViewController: UIViewController {

    struct GlobalVariable {
        static var allVideo: [Video]=[]
        static var voteVideo: [Video]=[]
        static var voteIndex=0
        static var tempVote: [Video]=[]
    }
    
    @IBOutlet weak var votedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        GlobalVariable.allVideo=homeListSreenViewController.GlobalVariable.videos
        
        GlobalVariable.voteVideo=filterVote()
        
        //GlobalVariable.voteVideo=GlobalVariable.allVideo
        
        votedTableView.delegate=self
        votedTableView.dataSource=self
        
        votedTableView.reloadData()
    }
    
    func filterVote() -> [Video]{
        var totvidvote:Int=GlobalVariable.allVideo.count
        GlobalVariable.tempVote.removeAll()
        for i in 0..<totvidvote{
            if GlobalVariable.allVideo[i].vote==true{
            GlobalVariable.tempVote.append(GlobalVariable.allVideo[i])
            }
        }
        return GlobalVariable.tempVote
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GlobalVariable.voteIndex=indexPath.row
        MovieDetailViewController.GlobalVariable.globalIndex=GlobalVariable.voteIndex
        
        performSegue(withIdentifier: "segue2", sender: self)
    }
}

extension votedListScreenViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariable.voteVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video=GlobalVariable.voteVideo[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"VotedCell") as! videoCellTableViewCell
        
        cell.setVideo(video: video)
        
        return cell
    }
}
