//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by Leonardo on 04/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

	@IBOutlet weak var textField: NSTextField!
	override var windowNibName: String? {
		return "MainWindowController"
	}


    override func windowDidLoad() {
        super.windowDidLoad()

    }

	@IBAction func generatePassowrd(sender: NSButton) {
		textField.stringValue = generateRandomStringOf(length: 8)
	}
}
