//
//  MyScrollView.swift
//  PagedReminderList
//
//  Created by Harry Ng on 27/6/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class MyScrollView: NSScrollView {
    
    var isSwiping = false {
        didSet {
            Swift.print("isSwiping: \(isSwiping)")
        }
    }
    var currentOffset = CGPoint(x: 0, y: 0)

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func scrollWheel(theEvent: NSEvent) {
        
        //theEvent.trackSwipeEventWithOptions(.LockDirection, dampenAmountThresholdMin: 0, max: 0) { (gestureAmount, phase, isCompleted, stop) in
            
            //if phase == NSEventPhase.Began {
                
            //}
            
            //Swift.print(gestureAmount)
            
            //self.documentView?.scrollPoint(NSMakePoint(248 * gestureAmount, 0))
        //}
        
        switch theEvent.phase {
        case NSEventPhase.Began:
            isSwiping = true
            currentOffset = self.documentVisibleRect.origin
        case NSEventPhase.Changed:
            Swift.print(theEvent.scrollingDeltaX)
        case NSEventPhase.Ended:
            isSwiping = false
            Swift.print(self.documentVisibleRect.origin)
            let offsetX = self.documentVisibleRect.origin.x - currentOffset.x
            
            if offsetX > 125 {
                self.contentView.animator().bounds.offsetInPlace(dx: 125, dy: 0)
            } else {
                self.contentView.animator().bounds.offsetInPlace(dx: -125, dy: 0)
            }
            
        default: break
        }
        
        super.scrollWheel(theEvent)
    }
}
