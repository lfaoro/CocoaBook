//
//  AppDelegate.swift
//  BusyApp
//
//  Created by Leonardo on 06/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	var busyWindowController: NSWindowController!


	func applicationDidFinishLaunching(aNotification: NSNotification) {

		busyWindowController = BusyWindowController()
		busyWindowController.showWindow(self)
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

