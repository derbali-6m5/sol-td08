//
//  Client.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import Foundation
class Client : Codable, Identifiable {
    internal init(id: String? = nil, nom: String, telephone: String, banqueId: String) {
        self.id = id
        self.nom = nom
        self.telephone = telephone
        self.banqueId = banqueId
    }
    
   
    //Swiftui manipule des objets Identifiable
    var id: String?
    var nom:String
    var telephone:String
    var banqueId:String
    
    
    
    enum CodingKeys : String , CodingKey {
        case id = "_id"
        case nom
        case telephone
        case banqueId
    }
}
