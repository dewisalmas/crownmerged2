//
//  CinemaController.swift
//  CinemaFix
//
//  Created by Fania Cecillia on 29/03/19.
//  Copyright © 2019 Fania Cecillia. All rights reserved.
//

import UIKit

class CinemaController: UIViewController {

    struct PublicVar {
        static var movies: [Video] = []
        static var myIndex=0
        static var myCityIndex=""
        static var searchingCity=false
        static var comingsoon=false
        static var indexMovie: [Int] = []
    }
    
    @IBOutlet weak var NSBtn: UIButton!
    @IBOutlet weak var CSBtn: UIButton!
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PublicVar.movies = createArray()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        NSBtnTapped(NSBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if PublicVar.searchingCity == true {
            CityLabel.text = PublicVar.myCityIndex
        }
        PublicVar.indexMovie.removeAll()
        if PublicVar.comingsoon == false {
            NSBtnTapped(NSBtn)
        }
        else {
            CSBtnTapped(CSBtn)
        }
    }
    
    @IBAction func CSBtnTapped(_ sender: UIButton) {
        PublicVar.comingsoon = true
        sender.setTitleColor(.white, for: .normal)
        NSBtn.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sender.backgroundColor = #colorLiteral(red: 1, green: 0.634967804, blue: 0.2223301232, alpha: 1)
        NSBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        PublicVar.indexMovie.removeAll()
        for n in 0...PublicVar.movies.count-1{
            if PublicVar.movies[n].cs == true && PublicVar.movies[n].location == CityLabel.text {
                PublicVar.indexMovie.append(n)
            }
        }
        movieTableView.reloadData()
    }
    
    @IBAction func NSBtnTapped(_ sender: UIButton) {
        PublicVar.comingsoon = false
        sender.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        CSBtn.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sender.backgroundColor = #colorLiteral(red: 1, green: 0.634967804, blue: 0.2223301232, alpha: 1)
        CSBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
        PublicVar.indexMovie.removeAll()
        for n in 0...PublicVar.movies.count-1{
            if PublicVar.movies[n].cs == false && PublicVar.movies[n].location == CityLabel.text {
                PublicVar.indexMovie.append(n)
            }
        }
        movieTableView.reloadData()
       
    }
        
    func createArray() -> [Video] {
        
        var tempMovies: [Video] = []
        
        var movie1 = Video(image: #imageLiteral(resourceName: "shoplifterss"), title: "SHOPLIFTERS", director: "Hirokazu Kore-eda",genre: "Drama", synopsis: "Sebuah keluarga yang tinggal di sebuah rumah kecil di Tokyo. Osamu dan anaknya yang masih kecil, Shota, tiap harinya mengutil untuk kebutuhan sehari-hari. Hingga suatu hari, di malam yang dingin, ia mereka bertemu dengan seorang gadis cilik yang terkunci di luar balkon apartement-nya, Yuri. Mereka pun mengajak Yuri pulang hanya dengan tujuan mengundangnya untuk makan malam. Hingga akhirnya mereka memutuskan untuk menjaga Yuri karena melihat tanda-tanda kekerasan dialami oleh Yuri.", duration: "02:01:00", year: "2018", location: "SURABAYA", poster: #imageLiteral(resourceName: "pshoplifters"), totvote: 50, publisher: "user001", publishedDate: "13-05-2018", screeningDate: "12 April 2019", vote: false, cs: true, startAt: "12.30", minute: "121 Minutes", theater: "CGV Marvell City")
        var movie2 = Video(image: #imageLiteral(resourceName: "ziarah"), title: "ZIARAH", director: "BW Purba Negara",genre: "Drama", synopsis: "Perjuangan Mbah Sri, seorang nenek berusia 95 tahun. Pada saat agresi militer Belanda ke 2 di tahun 1948, Sri terpisah dengan Prawiro, suaminya, yang kala itu pergi berperang. Setelah perang usai Prawiro tak pernah kembali. Puluhan tahun berlalu, mbah Sri menjanda hingga masa tuanya.", duration: "01:27:00", year: "2017", location: "SURABAYA", poster: #imageLiteral(resourceName: "pziarah"), totvote: 83, publisher: "user002", publishedDate: "18-05-2017", screeningDate: "4 April 2019", vote: false, cs: false, startAt: "16.45", minute: "87 Minutes", theater: "XXI Pakuwon Mall")
        var movie3 = Video(image: #imageLiteral(resourceName: "turah"), title: "TURAH", director: "Wicaksono Wisnu Legowo",genre: "Drama", synopsis: "Kehidupan masyarakat Kampung Tirang di kota tegal yang mengalami isolasi selama bertahun-tahun yang kemudian memunculkan berbagai problema.Kerasnya persaingan hidup menyisakan orang-orang kalah di Kampung Tirang.", duration: "01:23:00", year: "2017", location: "SURABAYA", poster: #imageLiteral(resourceName: "pturah"), totvote: 44, publisher: "user003", publishedDate: "06-09-2017", screeningDate: "3 Mei 2019", vote: false, cs: true, startAt: "10.15", minute: "83 Minutes", theater: "XXI Supermall")
        var movie4 = Video(image: #imageLiteral(resourceName: "ikk"), title: "ISTIRAHATLAH KATA - KATA", director: "Yosep Anggi Noen",genre: "Adventure & Biography", synopsis: "Wiji Thukul, seorang penyair yang dikenal karena kelantangannya meneriakkan ketidakadilan di masa protes politik meningkat. Ketika kerusuhan Jakarta 1996, dia dan beberapa aktivis dituduh bertanggung jawab dan dikejar aparat keamanan. Dipaksa pergi, Wiji terbang ke Pontianak di mana dia bersembunyi selama delapan bulan, kadang bersama orang asing. Di sana dia mengganti identitasnya beberapa kali, tapi masih juga menulis puisi dan cerita pendek.", duration: "01:37:00", year: "2017", location: "SURABAYA", poster: #imageLiteral(resourceName: "pikk"), totvote: 39, publisher: "user004", publishedDate: "19-01-2017", screeningDate: "15 Mei 2019", vote: false, cs: true, startAt: "18.00", minute: "97 Minutes", theater: "XXI Ciputra World")
        var movie5 = Video(image: #imageLiteral(resourceName: "sekala"), title: "SEKALA NISKALA (THE SEEN AND UNSEEN)", director: "Kamili Andini",genre: "Drama", synopsis: "Tantri yang selalu menemani Tantra, saudara kembarnya yang tergeletak lemah akibat penyakit yang menyerang otak. Bermain musik hingga menari bersama menjadi hal yang dilakukan bocah 10 tahun itu selama di rumah sakit. Semua itu membawa keceriaan tersendiri bagi Tantra maupun Tantri.Namun semakin hari kondisi Tantra semakin lemah.", duration: "01:23:00", year: "2018", location: "SEMARANG", poster: #imageLiteral(resourceName: "psekala"), totvote: 86, publisher: "user005", publishedDate: "01-03-2018", screeningDate: "4 April 2019", vote: false, cs: false, startAt: "12.30", minute: "83 Minutes", theater: "XXI Paragon Mall")
        var movie6 = Video(image: #imageLiteral(resourceName: "marlina"), title: "MARLINA SI PEMBUNUH DALAM EMPAT BABAK", director: "Mouly Surya",genre: "Western", synopsis: "Awalnya Marlina hidup tenang di Sumba, sampai pada suatu hari seorang pria bernama Markus dan gengnya mencoba merampok rumahnya. Marlina membunuh Markus dan sejak saat itu, hidup Marlina tidak lagi sama.", duration: "01:30:00", year: "2017", location: "SEMARANG", poster: #imageLiteral(resourceName: "pmarlina"), totvote: 97, publisher: "user006", publishedDate: "01-11-2017", screeningDate: "4 April 2019", vote: false, cs: false, startAt: "16.45", minute: "90 Minutes", theater: "XXI Citraland Mall")
        var movie7 = Video(image: #imageLiteral(resourceName: "postcard"), title: "POSTCARD FROM THE ZOO", director: "Edwin",genre: "Drama", synopsis: "Lana kecil berusia tiga tahun saat ayah menelantarkannya di kebun binatang. Dibesarkan oleh seorang pelatih jerapah, kebun binatang adalah satu-satunya dunia yang ia ketahui. Saat seorang pesulap muncul di kebun binatang, Lana jatuh cinta, keluar dari kebun binatang, dan membuka dirinya untuk sebuah petualangan.", duration: "01:35:00", year: "2012", location: "SEMARANG", poster: #imageLiteral(resourceName: "ppostcard"), totvote: 72, publisher: "user007", publishedDate: "23-04-2012", screeningDate: "23 April 2019", vote: false, cs: true, startAt: "16.45", minute: "95 Minutes", theater: "XXI Transmart Setiabudi")
        
        tempMovies.append(movie1)
        tempMovies.append(movie2)
        tempMovies.append(movie3)
        tempMovies.append(movie4)
        tempMovies.append(movie5)
        tempMovies.append(movie6)
        tempMovies.append(movie7)
        
        return tempMovies
    }
}
extension CinemaController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PublicVar.indexMovie.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = PublicVar.movies[PublicVar.indexMovie[indexPath.row]]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.setMovie(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PublicVar.myIndex = PublicVar.indexMovie[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
}
