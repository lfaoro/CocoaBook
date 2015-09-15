//
//  BusyWindowController.swift
//  BusyApp
//
//  Created by Leonardo on 06/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

class BusyWindowController: NSWindowController {
	override var windowNibName: String? {
		return "BusyWindowController"
	}
	var oldSliderValue = 0

	@IBOutlet weak var verticalSlider: NSSlider!
	@IBOutlet weak var hideSliderTickMarks: NSButton!
	@IBOutlet weak var showSliderTickMarks: NSButton!
	@IBOutlet weak var verticalSliderObserver: NSTextField!

	@IBOutlet weak var secretMessageInput: NSSecureTextField!
	@IBOutlet weak var secretMessageOutput: NSTextField!



	override func windowDidLoad() {
		super.windowDidLoad()
	}

	@IBAction func verticalSlider(sender: NSSlider) {

		if sender.integerValue > oldSliderValue {
			verticalSliderObserver.stringValue = "Slider went UP!"
			oldSliderValue = sender.integerValue
		} else if sender.integerValue < oldSliderValue {
			verticalSliderObserver.stringValue = "Slider went DOWN!"
			oldSliderValue = sender.integerValue
		} else {
			verticalSliderObserver.stringValue = "Slider went NOWHERE!"
		}
	}

	@IBAction func hideSliderTickMarks(sender: NSButton) {
		verticalSlider.numberOfTickMarks = 0
		showSliderTickMarks.state = NSOffState
	}

	@IBAction func showSliderTickMarks(sender: NSButton) {
		verticalSlider.numberOfTickMarks = 12
		hideSliderTickMarks.state = NSOffState
	}

	@IBAction func revealSecretMessage(sender: NSButton) {
		secretMessageOutput.stringValue = secretMessageInput.stringValue
	}

}
