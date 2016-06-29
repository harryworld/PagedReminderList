//
//  MyScrollView.swift
//  PagedReminderList
//
//  Created by Harry Ng on 27/6/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class MyScrollView: NSScrollView {
    
    override var hasHorizontalScroller: Bool {
        get { return false }
        set { }
    }
    
    var isSwiping = false {
        didSet {
            Swift.print("isSwiping: \(isSwiping)")
        }
    }
    var currentOffset = CGPoint(x: 0, y: 0)

    override func scrollWheel(theEvent: NSEvent) {
        
        switch theEvent.phase {
        case NSEventPhase.Began:
            isSwiping = true
            if let collectionView = self.documentView as? MyCollectionView {
                collectionView.setXOffset(248)
            }
            currentOffset = self.documentVisibleRect.origin
            Swift.print("Start : \(currentOffset)")
        case NSEventPhase.Changed:
            Swift.print(self.documentVisibleRect.origin.x)
            super.scrollWheel(theEvent)
        case NSEventPhase.Ended:
            isSwiping = false
            Swift.print("End at: \(self.documentVisibleRect.origin)")
            
            let offsetX = self.documentVisibleRect.origin.x
            let diff = offsetX - currentOffset.x
            
            if let collectionView = self.documentView as? MyCollectionView {
                if diff > 125 {
                    collectionView.scrollToX(248 * 2)
                } else if diff < -125 {
                    collectionView.scrollToX(248 * 0)
                } else {
                    collectionView.scrollToX(248 * 1)
                }
            }
        default: break
        }
        
        //super.scrollWheel(theEvent)
    }
}
