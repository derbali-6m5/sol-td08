//
//  DemoUIView.swift
//  sol-td08
//
//  Created by admin on 2023-04-12.
//

import SwiftUI

struct DemoUIView: View {
    @State private var selectedStrength: String = ""
        @State private var askForStrength: String = ""
        @State private var ask: Bool = false
        let strengths = ["1","2","3"]
    var body: some View {
//        NavigationView{
//            VStack{
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                    .font(.title)
//                    .foregroundColor(.red)
//                    .frame(width: 200, height: 200)
//                Spacer()
//                Image(systemName: "sunrise.fill")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                HStack{
//                    Text("Hello, World!")
//                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//
//                }
//                NavigationLink(destination: AutreView(), label:{ Text("Go Next")
//                        .foregroundColor(.blue)
//                        .font(.title)
//                        .padding()
//                        .frame(width: 200, height: 100)
//                        .background(.yellow)
//                        .border(.black)
//                }
//
//                )
//
//                Spacer()
//            }
//        }
//    }
//}
//
//struct AutreView : View{
//    var body: some View{
//        VStack{
//            Text("Hello")
//        }
        NavigationView {
                    Form {
                        Section {
                            Picker("Strength", selection: Binding(get: {selectedStrength}, set: {
                                //assign the selection to the temp var
                                askForStrength = $0
                                // show the Alert
                                ask = true
                            })) {
                                ForEach(strengths, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                }.alert(isPresented: $ask) {
                    // Here ask the user if selection is correct and apply the temp var to the selection
                    Alert(title: Text("select?"), message: Text("Do you want to select \(askForStrength)"), primaryButton: .default(Text("select"), action: {selectedStrength = askForStrength}), secondaryButton: .cancel())
                }
    }
}


struct DemoUIView_Previews: PreviewProvider {
    static var previews: some View {
        DemoUIView()
    }
}
