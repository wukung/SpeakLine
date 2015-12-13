//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by 鄭智仁 on 2015/12/13.
//  Copyright © 2015年 鄭智仁. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    let speechSynth = NSSpeechSynthesizer()
    var isStarted = false {
        didSet {
            updateButtons()
        }
    }
    
    // MARK: Overrided methods
    override var windowNibName : String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        updateButtons()
    }
    
    // MARK: - Action methods
    @IBAction func speakIt(sender: NSButton) {
        // Get type-in text as a string
        let string = textField.stringValue
        
        if string.isEmpty {
            print("String from \(textField) is empty");
        }
        else {
            print("String from \(textField) is \(string)")
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    
    @IBAction func stopIt(sender: NSButton) {
        print("stop button clicked")
        speechSynth.stopSpeaking()
        isStarted = false
    }
    
    func updateButtons() {
        if isStarted {
            speakButton.enabled = false
            stopButton.enabled = true
        }
        else {
            speakButton.enabled = true
            stopButton.enabled = false
        }
    }
}
