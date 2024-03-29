//
//  ContentView.swift
//  FastFerryWatch WatchKit Extension
//
//  Created by Rees Klintworth on 11/19/19.
//  Copyright © 2019 Rees Klintworth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var title: String

    var body: some View {
        TimetableList(title: title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(title: "Manly")
    }
}
