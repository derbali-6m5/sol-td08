//
//  ClientsUIView.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import SwiftUI

struct ClientsUIView: View {
    var banque: Banque
    @State var clients = [Client]()
    @State var showEditAlert = false
    @State var editClient : Client?
    @State var editNom = ""
    @State var editTel = ""
    
    func supprimerClient(id:String){
        print(id)
        //appel du service Web
        ClientRestAPI().deleteClient(idClient: id)
        //mise à jour de l'affichage
        if let position = clients.firstIndex(where: {$0.id == id}){
            clients.remove(at: position)
        }
    }
    
    var body: some View {
        VStack{
            Text("Client de \(banque.nom)")
            Spacer()
            NavigationView{
                List{
                    ForEach(clients){
                        client in
                        Text(client.nom)
                            .swipeActions{
                                Button{
                                    //action
                                    supprimerClient(id: client.id!)
                                } label: {
                                    Label("Supprimer", systemImage: "trash.fill")
                                }.tint(.red)
                                
                                Button{
                                    //action
                                    showEditAlert = true
                                    self.editClient = client
                                    editNom = client.nom
                                    editTel = client.telephone
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }.tint(.blue)
                            }
                    }
                }
            }
            
        }
        .onAppear(){
            if banque.id != nil{
                ClientRestAPI().getAllForBank(banqueId: banque.id!){
                    (clients) in
                    self.clients = clients
                }
            }
        }
        .alert("Editer", isPresented: $showEditAlert){
            if let client = self.editClient {
                
                TextField(client.nom, text: $editNom)
                TextField(client.telephone, text: $editTel)
            }
            Button("Ok"){
                self.editClient?.nom = editNom
                self.editClient?.telephone = editTel
                //appel du service Web
                ClientRestAPI().updateClient(client: editClient!)
                //mise à jour de l'affichage
                if let position = self.clients.firstIndex(where: {$0.id == self.editClient?.id}){
                    self.clients[position] = self.editClient!
                }
                
            }
            Button("Annuler", role: .cancel){}
        }
        

        
    }
}

struct ClientsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsUIView(banque: Banque(nom: "Test", ville: "Test"))
    }
}
