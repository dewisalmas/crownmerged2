//
//  GenreViewController.swift
//  FilmIndie
//
//  Created by claudia kenyta on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var editLabel: UILabel!
    
    private let dataSource = ["Pick Genre","Drama","Comedy","Thriller","Horror","Romance","Slice of Life","Dramasci-Fi","Action","Historical","Adventure"]

    
    @IBAction func editButtonPress(_ sender: Any) {
        editLabel.text = "asdfgh"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextGenre(_ sender: Any) {
        let genre = resultLabel.text!
        UserDefaults.standard.set(genre, forKey: "genre")
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
extension GenreViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultLabel.text = dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    
}
