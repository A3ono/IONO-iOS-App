//
//  StockNewsModel.swift
//  IONO_App
//
//  Created by Alexandra Medina
//
import Foundation

struct StockNewsModel: Decodable {
    let results:[StockNews]
}

struct StockNews: Decodable{
    
    let title: String?
    let author: String?
    let published_utc: String?
    let image_url: String?
}
