//
//  AppDelegate.swift
//  Thermostat
//
//  Created by Leonardo on 13/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	var mainWindowController: MainWindowController?

	func applicationDidFinishLaunching(aNotification: NSNotification) {

		mainWindowController = MainWindowController()
		mainWindowController?.showWindow(self)
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

