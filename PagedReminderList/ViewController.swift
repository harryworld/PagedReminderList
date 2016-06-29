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
    @IBOutlet weak var collectionView: MyCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        collectionView.setXOffset(248)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func gotoInitial(sender: AnyObject) {
        collectionView.scrollToX(0)
    }
    
    @IBAction func press(sender: AnyObject) {
        print("press")
        
        collectionView.scrollToX(248)
    }

    @IBAction func gotoLast(sender: AnyObject) {
        collectionView.scrollToX(496)
    }
}

extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItemWithIdentifier("Item", forIndexPath: indexPath)
        item.textField?.stringValue = "Label \(indexPath.item)"
        
        return item
    }
    
}
