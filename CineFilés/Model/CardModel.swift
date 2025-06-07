//
//  CardModel.swift
//  Cinefiles
//
//  Created by Carla Araujo on 01/06/25.
//

import Foundation

struct Card: Identifiable{
    let id = UUID()
    let abstractBackground: String
    let label1: String
    let label2: String
    let image: String
}
