//
//  TimetableList.swift
//  FastFerryWatch WatchKit Extension
//
//  Created by Rees Klintworth on 11/23/19.
//  Copyright © 2019 Rees Klintworth. All rights reserved.
//

import CoreLocation
import SwiftUI

struct TimetableList: View {
    var title: String

    var displayTitle: String {
        let manlyDistance = manlyLocation.distance(from: currentLocation)
        let circularQuayDistance = circularQuayLocation.distance(from: currentLocation)
        if title == "Manly", manlyDistance < circularQuayDistance {
            return title + " (Closest)"
        } else if title == "Circular Quay", circularQuayDistance < manlyDistance {
            return title + " (Closest)"
        }
        return title
    }

    var currentLocation: CLLocation {
        if let delegate = WKExtension.shared().delegate as? ExtensionDelegate {
            return delegate.currentLocation
        }
        return CLLocation()
    }
    
    var manlyLocation: CLLocation = CLLocation(latitude: CLLocationDegrees(exactly: -33.8005)!, longitude: CLLocationDegrees(exactly: 151.2838)!)
    var circularQuayLocation: CLLocation = CLLocation(latitude: CLLocationDegrees(exactly: -33.8607)!, longitude: CLLocationDegrees(exactly: 151.2110)!)
    
    var timetable: Timetable {
        let url = Bundle.main.url(forResource: "timetable.json", withExtension: nil) ?? URL(fileURLWithPath: "")
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode(Timetable.self, from: data)
    }

    var schedule: Day {
        let dayOfWeek = Calendar.current.dateComponents([.weekday], from: Date()).weekday ?? 1
        let location = title == "Manly" ? timetable.manly : timetable.circular_quay
        if dayOfWeek > 1 && dayOfWeek < 7 {
            return location.weekday
        }
        return location.weekend
    }

    var body: some View {
        List {
            Section(header: Text(displayTitle)) {
                ForEach(schedule.times, id: \.hashValue) { time in
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
