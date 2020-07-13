//
//  MIDIInput.swift
//  Digital D1
//
//  Created by Matthew Fecher on 11/12/17.
//  Copyright © 2017 AudioKit Pro. All rights reserved.
//

import Foundation

class MIDIInput {
    var name = "Session 1"
    var isOpen = true

    init() {
    }

    convenience init(name: String, isOpen: Bool) {
        self.init()

        self.name = name
        self.isOpen = isOpen
    }
}
