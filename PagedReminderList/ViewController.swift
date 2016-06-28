//
//  ViewController.swift
//  PagedReminderList
//
//  Created by Harry Ng on 27/6/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var scrollView: MyScrollView!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func press(sender: AnyObject) {
        print("press")
        
        NSAnimationContext.beginGrouping()
        NSAnimationContext.currentContext().duration = 3
        scrollView.animator().documentView?.scrollPoint(NSMakePoint(50, 0))
        NSAnimationContext.endGrouping()
    }

}

extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItemWithIdentifier("Item", forIndexPath: indexPath)
        item.textField?.stringValue = "Label \(indexPath.item)"
        
        return item
    }
    
}
