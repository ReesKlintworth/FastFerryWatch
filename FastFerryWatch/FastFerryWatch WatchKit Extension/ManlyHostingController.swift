//
//  ManlyHostingController.swift
//  FastFerryWatch WatchKit Extension
//
//  Created by Rees Klintworth on 11/19/19.
//  Copyright © 2019 Rees Klintworth. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class ManlyHostingController: WKHostingController<ContentView> {
    override var body: ContentView {
        return ContentView(title: "Manly")
    }
}
