//
//  BanqueRestAPI.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import Foundation
class BanqueRestAPI : ObservableObject {
    @Published var banques = [Banque]()
    
    let sesstion = URLSession.shared
    let url = URL(string: "https://derbali-36d8.restdb.io/rest/banques")
    
    
    func getAll(completion: @escaping ([Banque]) -> ()){
        var request = URLRequest(url: url!)
        request.addValue("232ec52be6fc72935ea68431ecf658ba36b5a", forHTTPHeaderField: "x-apikey")
        let task = sesstion.dataTask(with: request, completionHandler: {
            (data, response, error) in
            do {
                //traitement
                if let resp = response as? HTTPURLResponse, resp.statusCode == 200 {
                    let decoder  = JSONDecoder()
                    let banques:[Banque] = try decoder.decode([Banque].self, from: data!)
                    for b in banques {
                        print(b.nom)
                    }
                    DispatchQueue.main.async {
                        completion(banques)
                    }
                }
            }catch{
                print("error while getting banques")
            }
            
        })
        
        task.resume()
    }
}
