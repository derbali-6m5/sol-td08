//
//  BanqueRestAPI.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import Foundation
class ClientRestAPI : ObservableObject {
    @Published var clients = [Client]()
    
    let session = URLSession.shared
    let url = URL(string: "https://derbali-36d8.restdb.io/rest/clients")
    
    
    func getAllForBank(banqueId:String, completion: @escaping ([Client]) -> ()){
        var request = URLRequest(url: url!)
        request.addValue("232ec52be6fc72935ea68431ecf658ba36b5a", forHTTPHeaderField: "x-apikey")
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            do {
                //traitement
                if let resp = response as? HTTPURLResponse, resp.statusCode == 200 {
                    let decoder  = JSONDecoder()
                    var clients:[Client] = try decoder.decode([Client].self, from: data!)
                    clients = clients.filter{
                        client in
                        return client.banqueId == banqueId
                    }
                    DispatchQueue.main.async {
                        completion(clients)
                    }
                }
            }catch{
                print("error while getting banques")
            }
            
        })
        
        task.resume()
    }
    
    func deleteClient(idClient:String) {
        
        let headers = [
            "Content-Type":"application/json",
            "x-apikey":"232ec52be6fc72935ea68431ecf658ba36b5a",
        ]
        let urlDelete = URL(string: "https://derbali-36d8.restdb.io/rest/clients/\(idClient)")
        var request = URLRequest(url: urlDelete!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "DELETE"
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            do {
                //traitement
                
                if let resp = response as? HTTPURLResponse {
                    print(resp.statusCode)
//                    if resp.statusCode == 200{
//                        DispatchQueue.main.async {
//
//                            self.clients.r
//                        }
//                    }
                        
                }
            }catch{
                print("error while getting banques")
            }
            
        })
        
        task.resume()
    }
    
    func updateClient(client:Client) {
        
        let headers = [
            "Content-Type":"application/json",
            "x-apikey":"232ec52be6fc72935ea68431ecf658ba36b5a",
        ]
        let urlPut = URL(string: "https://derbali-36d8.restdb.io/rest/clients/\(client.id!)")
        var request = URLRequest(url: urlPut!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "PUT"
        let encoder = JSONEncoder()
        let data = try? encoder.encode(client)
        request.httpBody = data
        
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            do {
                //traitement
                if let resp = response as? HTTPURLResponse {
                    print(resp.statusCode)
                }
            }catch{
                print("error while getting banques")
            }
            
        })
        
        task.resume()
    }
}
