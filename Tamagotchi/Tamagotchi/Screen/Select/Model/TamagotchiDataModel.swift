//
//  SelectDataModel.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/07/23.
//

import Foundation

struct TamagotchiDataModel {
    var image: String
    var name: String
    var description: String
    var level: Int
}

struct Tamagotchi {
    let tamagotchi: [TamagotchiDataModel] = [
        TamagotchiDataModel(image: "1-1", name: "따끔따끔 다마고치", description: "저는 방실방실다마고치 입니당 키는 100km", level: 1),
        TamagotchiDataModel(image: "2-1", name: "방실방실 다마고치", description: "방실방실 다마고치", level: 1),
        TamagotchiDataModel(image: "3-1", name: "반짝반짝 다마고치", description: "방실방실 다마고치", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
        TamagotchiDataModel(image: "noImage", name: "준비중이에요", description: "준비중이에요", level: 1),
    ]
}
