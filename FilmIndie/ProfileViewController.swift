//
//  ProfileViewController.swift
//  FilmIndie
//
//  Created by Dewi Salma Salsabila on 01/04/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePict: UIImageView!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textUsername: UITextField!
    @IBOutlet weak var textBio: UITextView!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textWebsite: UITextField!
    @IBOutlet weak var btnTextEdit: UIButton!
    @IBOutlet weak var btnTextSave: UIButton!
    @IBOutlet weak var btnSignOut: UIButton!
    
    
    @IBAction func btnEdit(_ sender: UIButton) {
        textName.isEnabled=true
        textUsername.isEnabled=true
        textBio.isEditable=true
        textAddress.isEnabled=true
        textAddress.isEnabled=true
        textWebsite.isEnabled=true
        
        btnTextSave.isHidden=false
        btnTextSave.isEnabled=true
        btnTextEdit.isHidden=true
        btnTextEdit.isEnabled=false
        
        btnSignOut.isHidden=true
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        textName.isEnabled=false
        textUsername.isEnabled=false
        textBio.isEditable=false
        textAddress.isEnabled=false
        textAddress.isEnabled=false
        textWebsite.isEnabled=false
        
        btnTextSave.isHidden=true
        btnTextSave.isEnabled=false
        btnTextEdit.isHidden=false
        btnTextEdit.isEnabled=true
        
        btnSignOut.isHidden=false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnTextSave.isHidden=true
        btnTextSave.isEnabled=false
        
        profilePict.image=#imageLiteral(resourceName: "p0517py6")
        textName.isEnabled=false
        textUsername.isEnabled=false
        textBio.isEditable=false
        textAddress.isEnabled=false
        textAddress.isEnabled=false
        textWebsite.isEnabled=false
        // Do any additional setup after loading the view.
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
