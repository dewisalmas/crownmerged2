//
//  homeListSreenViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class homeListSreenViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    struct GlobalVariable{
        static var videos: [Video] = []
        static var myIndex=0
        static var sVid: [Video] = []
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData: [String] = []
    var fitDat: [String] = []
    var vidTitles = ["Biru Langit", "Sebut Saja Mawar", "Lurus", "Semi yang Gugur", "Ulat Dewasa", "Danau"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
              GlobalVariable.videos = createArray()
        
        for i in GlobalVariable.videos{
            filteredData.append(i.title)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.delegate=self
        tableView.dataSource=self
        
        tableView.reloadData()
    }
    
    func createArray() -> [Video]{
        var tempVideos: [Video] = []
        
        var video0 = Video(image: #imageLiteral(resourceName: "Untitled"), title: "Movie Title", director: "Movie Director", genre: "Movie Genre", synopsis: "Movie Synopsis", duration: "Movie Duration", year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 12, publisher: "user001", publishedDate: "12-01-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video1 = Video(image: #imageLiteral(resourceName: "parachute-4078833_640"), title: vidTitles[0], director: "Galih Ratih", genre: "Slice of Life", synopsis: "Disaat langit tak lagi biru", duration: "00:53:02", year: "2019", location: "Malang", poster:#imageLiteral(resourceName: "Untitled"), totvote: 8, publisher: "user002", publishedDate: "12-03-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video2 = Video(image: #imageLiteral(resourceName: "tulips-4072214_640"), title: vidTitles[1], director: "Trisha Hanum", genre: "Drama", synopsis: "Arti dari sekuntum bunga yang dianggap sebagai mawar oleh wanita itu dibiarkan menengadah seolah menerima debu", duration: "00:41:56", year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 6, publisher: "user003", publishedDate: "23-02-2019", screeningDate: "",vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video3 = Video(image: #imageLiteral(resourceName: "landscape-4078191_640"), title: vidTitles[2], director: "Tetap Bagus", genre: "Comedy", synopsis: "Hidup kok lurus-lurus aja", duration: "00:32:00", year: "2019", location: "Semarang", poster:#imageLiteral(resourceName: "Untitled"), totvote: 34, publisher: "user004", publishedDate: "03-02-2019", screeningDate: "", vote:true, cs: false, startAt:"", minute:"", theater:"")
        var video4 = Video(image: #imageLiteral(resourceName: "sun-4076124_640"), title: vidTitles[3], director: "Radi Alga", genre: "Romance", synopsis: "Musim dimana aku bertemu kamu", duration: "00:54:09", year: "2019", location: "Malang", poster:#imageLiteral(resourceName: "Untitled"), totvote: 42, publisher: "user005", publishedDate: "17-03-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        var video5 = Video(image: #imageLiteral(resourceName: "butterfly-4072394_640"), title: vidTitles[4], director: "Chandra Dika", genre: "Thriller", synopsis: "Ketika serigala berbulu domba, ketika pemangsa bersayap kupu-kupu", duration: "01:03:56", year: "2019", location: "Jakarta", poster:#imageLiteral(resourceName: "Untitled"), totvote: 62, publisher: "user006", publishedDate: "01-01-2019", screeningDate: "", vote:true, cs: false, startAt:"", minute:"", theater:"")
        var video6 = Video(image: #imageLiteral(resourceName: "river-4080606_640"), title: vidTitles[5], director: "Merin Angga", genre: "Mystery", synopsis: "Sunyi tak berarti sepi, diam tak berarti acuh", duration: "00:43:06",year: "2019", location: "Surabaya", poster:#imageLiteral(resourceName: "Untitled"), totvote: 4, publisher: "user007", publishedDate: "23-03-2019", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        
        //tempVideos.append(video0)
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        
        return tempVideos
    }
    
//CODING ACTION APA AJA DI PAGE INI

    func searchVid() -> [Video]{
        GlobalVariable.sVid.removeAll()
        
        for i in 0..<GlobalVariable.videos.count{
            if filteredData.contains(GlobalVariable.videos[i].title){
                GlobalVariable.sVid.append(GlobalVariable.videos[i])
            }
        }
        return GlobalVariable.sVid
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? vidTitles: vidTitles.filter{ (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        print(filteredData)
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        GlobalVariable.videos.removeAll()
        GlobalVariable.videos = createArray()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GlobalVariable.myIndex=indexPath.row
        MovieDetailViewController.GlobalVariable.globalIndex=GlobalVariable.myIndex
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        GlobalVariable.videos=searchVid()
//        print(GlobalVariable.videos.count)
//        print(indexPath.count)
        let cell = tableView.dequeueReusableCell(withIdentifier:"VideoCell") as! videoCellTableViewCell
        if filteredData.count == 6{
            cell.setVideo(video: GlobalVariable.videos[indexPath.row])
        }else{
            for i in 0..<GlobalVariable.videos.count{
                for j in filteredData{
                    if j ==  GlobalVariable.videos[i].title{
                        if filteredData.count == 1{
                            cell.setVideo(video: GlobalVariable.videos[i])
                            print(indexPath.row)
                        }else{
                            cell.setVideo(video: GlobalVariable.videos[indexPath.row])
                            
                        }
                    }
                }
            }
        }
        return cell
    }
}
