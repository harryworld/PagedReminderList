//
//  MyFlowLayout.swift
//  PagedReminderList
//
//  Created by Harry Ng on 6/8/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class MyFlowLayout: NSCollectionViewFlowLayout {

    override var collectionViewContentSize: NSSize {
        return NSSize(width: collectionView!.bounds.width, height: 2000)
    }

}
