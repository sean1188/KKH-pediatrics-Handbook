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

//////VERSION 2//
//
//  PDFManager.swift
//  Handbook
//
//  Created by Ravern on 9/6/16.
//  Copyright © 2016 SST Inc. All rights reserved.
//

/**
import UIKit

class PDFManager: NSObject {
    
    var chapterPaths: [String]!
    var referencePaths: [String]!
    
    override init() {
        super.init()
        let bundleRoot = NSBundle.mainBundle().bundlePath
        let fileManager = NSFileManager.defaultManager()
        var contents: [String]!
        do { contents = try fileManager.contentsOfDirectoryAtPath(bundleRoot) } catch { }
        chapterPaths = contents.filter { (string) -> Bool in
            if string.hasSuffix(".pdf") && string.hasPrefix("C") { return true }
            return false
        }
        referencePaths = contents.filter { (string) -> Bool in
            if string.hasSuffix(".pdf") && string.hasPrefix("R") { return true }
            return false
        }
    }
    
    func numberOfChapters() -> Int {
        return chapterPaths.count
    }
    
    func numberOfReferencesForChapter(chapter: Int) -> Int {
        var prefix: String = ""
        if chapter < 9 {
            prefix = "0"
        }
        return referencePaths.filter({ (path) -> Bool in
            if path.hasPrefix("R\(prefix)\(chapter + 1)") {
                return true
            }
            return false
        }).count
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
        pathh = pathh.substringFromIndex(4)
        pathh = pathh.stringByReplacingOccurrencesOfString("_", withString: " ")
        return pathh as String
    }
    
    func reference(chapter: Int, index: Int) -> UIView {
        var prefix: String = ""
        if chapter < 9 {
            prefix = "0"
        }
        let referencePaths = self.referencePaths.filter({ (path) -> Bool in
            if path.hasPrefix("R\(prefix)\(chapter + 1)") {
                return true
            }
            return false
        })
        let pathh = (referencePaths[index] as NSString?)!
        let path = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource(pathh.substringToIndex(pathh.length - 4), ofType:"pdf")!)
        let request = NSURLRequest(URL: path);
        let webView = UIWebView()
        webView.loadRequest(request);
        return webView
    }
    
    func titleForReference(chapter: Int, index: Int) -> String {
        var prefix: String = ""
        if chapter < 9 {
            prefix = "0"
        }
        let referencePaths = self.referencePaths.filter({ (path) -> Bool in
            if path.hasPrefix("R\(prefix)\(chapter + 1)") {
                return true
            }
            return false
        })
        var pathh = (referencePaths[index] as NSString?)!
        pathh = pathh.substringToIndex(pathh.length - 4)
        pathh = pathh.substringFromIndex(6)
        pathh = pathh.stringByReplacingOccurrencesOfString("_", withString: " ")
        return pathh as String
    }
}
 */
 