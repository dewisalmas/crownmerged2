//
//  AddMovieViewController.swift
//  FilmIndie
//
//  Created by claudia kenyta on 29/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var imagePicker = UIImagePickerController()
    var imageScenePicker = UIImagePickerController()
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var sceneImageButton: UIButton!
    @IBOutlet weak var sceneImageView: UIImageView!
    @IBOutlet weak var posterImageButton: UIButton!
    @IBOutlet weak var producerField: UITextField!
    @IBOutlet weak var synopsisField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearofproductionField: UITextField!
    @IBOutlet weak var screeningLocationField: UITextField!
    @IBOutlet weak var movieDuration: UIDatePicker!
    @IBOutlet weak var movieDurationLabel: UITextField!
    
    var data = [String]()
    var data2 = [String]()
    var picker = UIPickerView()
    var picker2 = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDurationLabel.isHidden=true
        
        titleField.delegate=self
        synopsisField.delegate=self
        producerField.delegate=self
        yearofproductionField.delegate=self
        screeningLocationField.delegate=self
        imagePicker.delegate=self
        imageScenePicker.delegate=self
        // Do any additional setup after loading the view.
        
        genreLabel.text = UserDefaults.standard.string(forKey: "genre")
        
        let year = Calendar.current.component(.year, from: Date())
        
        for i in (2000...year){
            data.append(String(i))
        }
        data2 = ["AMBON", "BALIKPAPAN", "BANDUNG", "BANJARMASIN", "BATAM", "BEKASI", "BENGKULU", "BOGOR", "CILEGON", "CIREBON", "DENPASAR", "GARUT", "GRESIK", "JAKARTA", "KARAWANG", "SURABAYA", "PALEMBANG"]
        picker.delegate = self
        picker.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        screeningLocationField.inputView = picker2
        yearofproductionField.inputView = picker
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == picker){
            return data.count
        }else{
            return data2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == picker){
            yearofproductionField.text = data[row]
        }
        else{
            screeningLocationField.text = data2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == picker){
            return data[row]
        }
        else{
            return data2[row]
        }
    }
    
    
    @IBAction func durationChanged(_ sender: Any) {
        //movieDurationLabel.text=movieDuration.
    }
    
    
    
    @IBAction func importImage(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing=true
        present(imagePicker,animated: true,completion: nil)

    }
    
    @IBAction func importSceneImage(_ sender: Any) {
        imageScenePicker.sourceType = .photoLibrary
        imageScenePicker.allowsEditing=true
        present(imageScenePicker,animated: true,completion: nil)
    }
    
    
    @IBAction func nextAddButton(_ sender: Any) {
        var titleText:String! = titleField.text
        var synopsisText:String! = synopsisField.text
        var producerText:String! = producerField.text
        var genreText:String! = genreLabel.text
        var yearofProduction:String! = yearofproductionField.text
        var screeningLocation:String! = screeningLocationField.text
        
        
        //var tempVideos = UserDefaults.standard.array(forKey: "tempVideos")
        let year = Calendar.current.component(.year, from: Date())
        let month = Calendar.current.component(.month, from: Date())
        let day=Calendar.current.component(.day, from: Date())
        
        
        var videoAdd = Video(image: #imageLiteral(resourceName: "pshoplifters"), title: titleText, director: producerText, genre: genreText, synopsis: synopsisText, duration: "00:01:00", year: yearofProduction, location: screeningLocation, poster:#imageLiteral(resourceName: "shoplifterss"), totvote: 0, publisher: "crown19", publishedDate: "\(day)-\(month)-\(year)", screeningDate: "", vote:false, cs: false, startAt:"", minute:"", theater:"")
        
        myLibraryListViewController.GlobalVariable.myVideos.insert(videoAdd, at: 0)
        homeListSreenViewController.GlobalVariable.videos.insert(videoAdd, at: 0)
        
        //tempVideos?.append(video0)
        //print(tempVideos)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if picker==imagePicker{
                    myImageView.image = image
            }
            if picker==imageScenePicker{
                sceneImageView.image = image
            }
        }
        
        
        dismiss(animated: true, completion: nil)
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
