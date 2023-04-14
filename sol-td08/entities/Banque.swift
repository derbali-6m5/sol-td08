//
//  Banque.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import Foundation
class Banque : Codable, Identifiable {
    internal init(id: String? = nil, nom: String, ville: String) {
        self.id = id
        self.nom = nom
        self.ville = ville
    }
    //Swiftui manipule des objets Identifiable
    var id: String?
    var nom:String
    var ville:String
    
    
    
    enum CodingKeys : String , CodingKey {
        case id = "_id"
        case nom
        case ville
    }
}
