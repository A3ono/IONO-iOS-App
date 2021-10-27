//
//  KicksModel.swift
//  IONO_App
//
//  Created by Alexandra Medina
//

import Foundation

struct KicksModel: Decodable {
    let results:[Kicks]
}

struct Kicks: Decodable{
    
    let shoes_name: String?
    let shoes_url: String?
    let shoes_date: String?
    let shoes_price: String?
    let shoes_image: String?
    let shoes_image_url: String?
    
}
