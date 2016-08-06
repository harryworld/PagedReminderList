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
            currentOffset = self.documentVisibleRect.origin
            Swift.print("Start : \(currentOffset)")
        case NSEventPhase.Changed:
            Swift.print(self.documentVisibleRect.origin.y)
            super.scrollWheel(theEvent)
        case NSEventPhase.Ended:
            isSwiping = false
            Swift.print("End at: \(self.documentVisibleRect.origin)")

            let offsetY = self.documentVisibleRect.origin.y
            let diff = offsetY - currentOffset.y

            if let collectionView = self.documentView as? MyCollectionView {
                Swift.print("diff: \(diff)")
                if diff >= -50 {
                    collectionView.scrollToY(50 * 1)
                }
            }
        default: break
        }

        //super.scrollWheel(theEvent)
    }
}
