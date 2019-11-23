//
//  TimetableList.swift
//  FastFerryWatch WatchKit Extension
//
//  Created by Rees Klintworth on 11/23/19.
//  Copyright © 2019 Rees Klintworth. All rights reserved.
//

import SwiftUI

struct TimetableList: View {
    var title: String

    var body: some View {
        
        List {
            Section(header: Text(title)) {
                ForEach(["6:00", "6:10", "7:00"], id: \.hashValue) { time in
                    Text(time)
                }
            }
        }
    }
}

struct TimetableList_Previews: PreviewProvider {
    static var previews: some View {
        TimetableList(title: "Manly")
    }
}
