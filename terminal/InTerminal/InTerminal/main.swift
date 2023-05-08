//
//  main.swift
//  InTerminal
//
//  Created by tamzimun on 19.07.2022.
//

import Foundation

struct Profile {
    var value = "Here"
}

final class Building<T> {
    var rooms: T
    init(value: T) {
        rooms = value
    }
}

struct Room<T> {
    var building: Building<T>
    init(value: T) {
        building = Building(value: value)
    }
    
    var value: T {
        get { return building.rooms }
        set {
            guard isKnownUniquelyReferenced(&building) else {
                building = Building(value: newValue)
                return
            }
            building.rooms = newValue
        }
    }
}



let profile = Profile()

let building = Building(value: profile)

let room = Room(value: "34t")

var room2 = room

print(room.building.rooms)
print(room2.building.rooms)

room2.building.rooms = "123"

print(room.building.rooms)
print(room2.building.rooms)




