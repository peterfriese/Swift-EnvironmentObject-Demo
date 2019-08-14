//
//  AppState.swift
//  SwiftUI EnvironmentObject Demo
//
//  Created by Peter Friese on 14/08/2019.
//  Copyright © 2019 Peter Friese. All rights reserved.
//

import Foundation

class AppState: ObservableObject {
  @Published var counter = 0
}
