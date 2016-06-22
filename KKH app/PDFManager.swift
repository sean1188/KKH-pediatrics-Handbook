//
//  PDFManager.swift
//  Handbook
//
//  Created by Ravern on 9/6/16.
//  Copyright © 2016 SST Inc. All rights reserved.
//

import UIKit

class PDFManager: NSObject {
    
    var chapterPaths: [String]!
    
    override init() {
        super.init()
        let bundleRoot = NSBundle.mainBundle().bundlePath
        let fileManager = NSFileManager.defaultManager()
        var contents: [String]!
        do { contents = try fileManager.contentsOfDirectoryAtPath(bundleRoot) } catch { }
        chapterPaths = contents.filter { (string) -> Bool in
            if string.hasSuffix(".pdf") { return true }
            return false
        }
    }
    
    func numberOfChapters() -> Int {
        return chapterPaths.count
    }
    
    
    func chapter(index: Int) -> UIView {
        let pathh = (chapterPaths[index] as NSString?)!
        let path = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource(pathh.substringToIndex(pathh.length - 4), ofType:"pdf")!)
        let request = NSURLRequest(URL: path);
        let webView = UIWebView()
        webView.loadRequest(request);
        return webView
    }
    
    func titleForChapter(index: Int) -> String {
        var pathh = (chapterPaths[index] as NSString?)!
        pathh = pathh.substringToIndex(pathh.length - 4)
        pathh = pathh.substringFromIndex(3)
        pathh = pathh.stringByReplacingOccurrencesOfString("_", withString: " ")
        return pathh as String
    }
}
