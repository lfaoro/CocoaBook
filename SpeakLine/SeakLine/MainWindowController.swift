//
//  MainWindowController.swift
//  SeakLine
//
//  Created by Leonardo on 06/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
	override var windowNibName: String? {
		return "MainWindowController"
	}
	@IBOutlet weak var textField: NSTextField!
	@IBOutlet weak var speakButton: NSButton!
	@IBOutlet weak var stopButton: NSButton!
	@IBOutlet weak var tableView: NSTableView!

	let speechSynth = NSSpeechSynthesizer()
	var speechSynthIsStarted: Bool = false {
		didSet {
			updateButtons()
		}
	}

	let voices = NSSpeechSynthesizer.availableVoices()
	var langs: [String] {
		return langsFor(voices: voices)
	}


	override func windowDidLoad() {
		super.windowDidLoad()

		speechSynth.delegate = self
		self.window?.delegate = self

		updateButtons()
		setDefaultVoice()
	}


	// MARK: - Action methods

	@IBAction func speakIt(sender: NSButton) {
		if !textField.stringValue.isEmpty {
			speechSynth.startSpeakingString(textField.stringValue)
		} else {
			speechSynth.startSpeakingString("Enter text in the input field.")
		}
	}

	@IBAction func stopIt(sender: NSButton) {
		speechSynth.stopSpeaking()
	}


	// MARK: - Helper methods

	func voiceNameFor(identifier identifier: String) -> String? {

		let attributes = NSSpeechSynthesizer.attributesForVoice(identifier)

		return attributes["VoiceName"] as? String
	}

	func langsFor(voices voices: [String]) -> [String] {

		var voiceLangs: [String] = []

		for voice in voices {

			let attr = NSSpeechSynthesizer.attributesForVoice(voice)["VoiceLanguage"] as! String
			voiceLangs.append(attr)
		}

		return voiceLangs
	}

	func updateButtons() {
		if speechSynthIsStarted {
			speakButton.enabled = false
			stopButton.enabled = true
		} else {
			speakButton.enabled = true
			stopButton.enabled = false
		}
	}

	func setDefaultVoice() {
		let defaultVoice = NSSpeechSynthesizer.defaultVoice()
		if let defaultRow = voices.indexOf(defaultVoice) {
			let index = NSIndexSet(index: defaultRow)

			tableView.selectRowIndexes(index, byExtendingSelection: false)
		}


	}
}


// MARK: - NSSpeechSynthesizerDelegate

extension MainWindowController: NSSpeechSynthesizerDelegate {

	func speechSynthesizer(sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, ofString string: String) {
		speechSynthIsStarted = true
		updateButtons()
	}

	func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
		speechSynthIsStarted = false
		updateButtons()
	}
}


// MARK: - NSWindowDelegate

extension MainWindowController: NSWindowDelegate {

	func windowShouldClose(sender: AnyObject) -> Bool {
		return !speechSynthIsStarted
	}

	func windowWillResize(sender: NSWindow, toSize frameSize: NSSize) -> NSSize {

		let size = NSSize(width: frameSize.width, height: frameSize.width / 2.0)

		return size
	}
}


// MARK: - NSTableViewDataSource

extension MainWindowController: NSTableViewDataSource {

	func numberOfRowsInTableView(tableView: NSTableView) -> Int {
		return voices.count
	}

	func tableView(tableView: NSTableView,
		objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {

			if tableColumn!.title == "Voices" {
				let voice = voices[row]
				let voiceName = voiceNameFor(identifier: voice)!

				return voiceName
			} else {
				
				let lang = langs[row]
				return lang
			}
	}

}


// MARK: - NSTableViewDelegate

extension MainWindowController: NSTableViewDelegate {

	func tableViewSelectionDidChange(notification: NSNotification) {
		let row = tableView.selectedRow
		let voice = voices[row]

		if row == -1 {
			speechSynth.setVoice(nil)
		} else {
			speechSynth.setVoice(voice)
		}
		
	}
}
