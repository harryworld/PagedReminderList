//
//  ViewController.swift
//  PagedReminderList
//
//  Created by Harry Ng on 27/6/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa
import SwiftyTimer

class ViewController: NSViewController {

    @IBOutlet weak var scrollView: MyScrollView!
    @IBOutlet weak var collectionView: MyCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        collectionView.collectionViewLayout = MyFlowLayout()

        NSTimer.after(0.3) {
            self.collectionView.setYOffset(50)
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

extension ViewController: NSCollectionViewDataSource {

    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {

        let item = collectionView.makeItemWithIdentifier("Item", forIndexPath: indexPath)
        item.textField?.stringValue = "Label \(indexPath.item)"

        return item
    }

}

extension ViewController: NSCollectionViewDelegateFlowLayout {

    func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> NSSize {
        return NSSize(width: collectionView.bounds.width, height: 50)
    }

}
