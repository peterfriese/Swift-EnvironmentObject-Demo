//
//  ContentView.swift
//  SwiftUI EnvironmentObject Demo
//
//  Created by Peter Friese on 14/08/2019.
//  Copyright © 2019 Peter Friese. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var state: AppState
  @State var presentDetailsView = false
  @State var presentDetailsViewNoEnvironment = false
  
  var body: some View {
    NavigationView {
      VStack {
        Button(action: { self.state.counter += 1 }) {
          Text("Current value: \(state.counter)")
        }
        NavigationLink(destination: DetailsView()) {
          Text("Navigate to details")
        }
        Button(action: { self.presentDetailsView = true }) {
          Text("Present details")
        }
        Button(action: { self.presentDetailsViewNoEnvironment = true }) {
          Text("Present details w/o Environment (will crash)")
        }
      }
      .navigationBarTitle("@EnvironmentObject: Master")
      .sheet(isPresented: $presentDetailsViewNoEnvironment) {
        DetailsView()
      }
      .sheet(isPresented: $presentDetailsView) {
        DetailsView().environmentObject(self.state)
      }
    }
  }
}

struct DetailsView: View {
  @EnvironmentObject var state: AppState
  
  var body: some View {
    Text("The value is \(state.counter)")
  }
  
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(AppState())
  }
}
#endif
