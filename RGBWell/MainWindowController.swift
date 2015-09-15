//
//  MainWindowController.swift
//  RGBWell
//
//  Created by Leonardo on 06/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

	override var windowNibName: String? {
		return "MainWindowController"
	}
	@IBOutlet weak var colorWell: NSColorWell!
	var r = 0.0
	var g = 0.0
	var b = 0.0
	var a = 1.0
	@IBOutlet weak var rSlider: NSSlider!
	@IBOutlet weak var gSlider: NSSlider!
	@IBOutlet weak var bSlider: NSSlider!


	override func windowDidLoad() {
		super.windowDidLoad()
		rSlider.doubleValue = r
		gSlider.doubleValue = g
		bSlider.doubleValue = b
		updateColor()
	}

	@IBAction func adjustRed(sender: NSSlider) {
		print("Slider value is ", sender.doubleValue)
		r = sender.doubleValue
		updateColor()
	}

	@IBAction func adjustGreen(sender: NSSlider) {
		print("Slider value is ", sender.doubleValue)
		g = sender.doubleValue
		updateColor()
	}

	@IBAction func adjustBlue(sender: NSSlider) {
		print("Slider value is ", sender.doubleValue)
		b = sender.doubleValue
		updateColor()
	}

	func updateColor() {
		let newColor = NSColor(
			calibratedRed: CGFloat(r),
			green: CGFloat(g),
			blue: CGFloat(b),
			alpha: CGFloat(a))

		colorWell.color = newColor
	}

}
