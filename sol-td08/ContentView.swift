//
//  ContentView.swift
//  sol-td08
//
//  Created by admin on 2023-04-10.
//

import SwiftUI

struct ContentView: View {
    @State var banques = [Banque]()
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            NavigationView{
                List{
                    ForEach(banques){
                        banque in
                        NavigationLink(destination: ClientsUIView(banque: banque), label:{
                            Text(banque.nom)
                                .font(.title)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.yellow)
                        })
                    }
                }
            }
            Spacer()
//            Button(action: {
//                print("HEllo World")
//            }, label: {
//                Text("Hello")
//            })
            Spacer()
        }
        .padding()
        .onAppear(){
            BanqueRestAPI().getAll(){
                (banques) in
                self.banques = banques
                
            }
        }
    }
}

struct HeaderView :View {
    var body: some View{
        Text("application bancaire")
            .textCase(.uppercase)
            .foregroundColor(.red)
            .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
