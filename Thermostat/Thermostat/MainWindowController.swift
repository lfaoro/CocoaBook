//
//  MainWindowController.swift
//  Thermostat
//
//  Created by Leonardo on 13/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

	dynamic var temperature = 68
	dynamic var isOn = true


	override var windowNibName: String {
		return "MainWindowController"
	}

	override func windowDidLoad() {
		super.windowDidLoad()
	}


	@IBAction func makeWarmer(sender: NSButton) {

//		willChangeValueForKey("temperature")
		temperature++
//		didChangeValueForKey("temperature")
	}

	@IBAction func makeCooler(sender: NSButton) {

		temperature--
	}
}
