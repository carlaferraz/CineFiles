//
//  DataTourModel.swift
//  Cinefiles
//
//  Created by Carla Araujo on 01/06/25.
//

import Foundation

struct DataModel{
    let cardsList: [Card] = [
        Card(
            abstractBackground: "abstract1",
            label1: "Aqui você se torna um",
            label2: "verdadeiro cinéfilo...",
            image: "image1"
        ),
        
        Card(
            abstractBackground: "abstract2",
            label1: "Receba recomendações ",
            label2: "filés toda semana!",
            image: "image2"
        ),
        
        Card(
            abstractBackground: "abstract3",
            label1: "Quem é o mais desocupado?",
            label2: "Crie um clube e descubra!",
            image: "image3"
        ),
        
        Card(
            abstractBackground: "abstract4",
            label1: "Curta ou esculache os filmes",
            label2: "que você viu",
            image: "image4"
        )
    ]
}
