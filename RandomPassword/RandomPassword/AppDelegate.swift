//
//  AppDelegate.swift
//  RandomPassword
//
//  Created by Leonardo on 04/09/2015.
//  Copyright © 2015 Leonardo Faoro. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	var mainWindowController: MainWindowController!


	func applicationDidFinishLaunching(aNotification: NSNotification) {

		//Create a window controller with a XIB
		mainWindowController = MainWindowController()

		// Put the window of the WC on screen
		mainWindowController.showWindow(self)

	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

