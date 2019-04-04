//
//  SearchCityController.swift
//  CinemaFix
//
//  Created by Fania Cecillia on 30/03/19.
//  Copyright © 2019 Fania Cecillia. All rights reserved.
//

import UIKit

class SearchCityController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var CityTableView: UITableView!
    
    let cities: [String] = ["AMBON", "BALI", "BALIKPAPAN", "BANDUNG", "BANJAR", "BANJARBARU", "BANJARNEGARA", "BANYUWANGI", "BATAM", "BATU", "BATURAJA", "BAU BAU", "BEKASI", "BITUNG", "BLITAR", "BOGOR", "BOJONEGORO", "BONDOWOSO", "CIAMIS", "CIKARANG", "CILACAP", "CIREBON", "DEMAK", "DEPOK", "GRESIK", "JAKARTA", "JAMBI", "JEMBER", "JOMBANG", "KARAWANG", "KEDIRI", "KENDARI", "KETAPANG", "KUPANG", "LAHAT", "LAMONG", "LAMPUNG", "LEBAK", "LOMBOK", "LUBUK LINGGAU", "MADIUN", "MAGELANG", "MAKASSAR", "MALANG", "MAMUJU", "MANADO", "MEDAN", "MOJOKERTO", "NGAWI", "PALEMBANG", "PALOPO", "PASURUAN", "PATI", "PEKANBARU", "PONOROGO", "PRABUMULIH", "PROBOLINGGO", "PURWAKARTA", "PURWOKERTO", "SAMPIT", "SEMARANG", "SERANG", "SIDOARJO", "SOLO", "SURABAYA", "TANGERANG", "TEGAL", "TEMANGGUNG", "TRENGGALEK", "TULUNGAGUNG", "WAJO", "YOGYAKARTA"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var searchCity = [String]()
    var searching = false
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchCity.count
        } else {
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if searching {
            cell.textLabel?.text = searchCity[indexPath.row]
        } else {
            cell.textLabel?.text = cities[indexPath.row]
        }
        return(cell)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCity = cities.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        CityTableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        SearchBar.text = ""
        CityTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CinemaController.PublicVar.searchingCity = true
        if searching {
            CinemaController.PublicVar.myCityIndex = searchCity[indexPath.row]
        } else {
            CinemaController.PublicVar.myCityIndex = cities[indexPath.row]
        }
        performSegue(withIdentifier: "segue", sender: self)
    }
}
