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
        TamagotchiDataModel(image: "1-6", name: "따끔따끔 다마고치", description: "저는 선인장 다마고치 입니다. 키는 2cm\n몸무게는 150g이에요.\n성격은 소심하지만 마음은 따듯해요.\n열심히 잘 먹고 잘 클 자신은 있답니다.\n반가워요 주인님!!!", level: 1),
        TamagotchiDataModel(image: "2-6", name: "방실방실 다마고치", description: "저는 방실방실 다마고치 입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 방실방실", level: 1),
        TamagotchiDataModel(image: "3-6", name: "반짝반짝 다마고치", description: "저는 반짝반짝 다마고치 입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 반짝반짝", level: 1),
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
