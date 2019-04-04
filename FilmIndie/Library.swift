//
//  Library.swift
//  FilmIndie
//
//  Created by claudia kenyta on 28/03/19.
//  Copyright © 2019 claudia kenyta. All rights reserved.
//

import UIKit
import Foundation

class Library {
    var image: UIImage
    var judul: String
    var sutradara: String
    var duration: String
    var genre: String
    var sinopsis: UITextView
    
    init(image: UIImage, judul: String, sutradara: String, duration: String, genre: String, sinopsis: UITextView) {
        self.image = image
        self.judul = judul
        self.sutradara = sutradara
        self.duration = duration
        self.genre = genre
        self.sinopsis = sinopsis
        
    }
    
}
