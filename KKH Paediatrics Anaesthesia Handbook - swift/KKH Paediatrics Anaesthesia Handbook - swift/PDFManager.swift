//
//  PDFManager.swift
//  Handbook
//
//  Created by Ravern on 9/6/16.
//  Copyright © 2016 SST Inc. All rights reserved.
//

import UIKit

class PDFManager: NSObject {
    
    var filePaths   : [String] = []
    // completely useless array :\
    var chapters_CHAR: [String] = []
    //
    var chapters_NAME: [String] = []

    
    override init() {
        super.init()
        let bundleRoot = Bundle.main.bundlePath
        let fileManager = FileManager.default
        var contents: [String]!
        do { contents = try fileManager.contentsOfDirectory(atPath: bundleRoot) } catch { }
        filePaths = contents.filter { (string) -> Bool in
            if string.hasSuffix(".pdf") { return true }
            return false
        }
        filePaths.forEach { (file) in
            if !chapters_CHAR.contains(file.substring(to: file.index(file.startIndex, offsetBy: 1))) {
                chapters_CHAR.append(file.substring(to: file.index(file.startIndex, offsetBy: 1)))
            }
        }
        
        if let path = Bundle.main.path(forResource: "index", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                var chapterNames = data.components(separatedBy: .newlines)
                chapterNames.removeLast(1)
                chapters_NAME = chapterNames
            } catch {
                print(error)
            }
        }
        
        print(chapters_NAME)
    }
    
    func numberOfFiles() -> Int {
        return filePaths.count
    }
    
    func numberOfChapters() -> Int {
        return chapters_CHAR.count
    }
    
    
    
    func filesForChapteratIndex (_ index : Int) -> ([String], [Int]){
        let character = chapters_CHAR[index]
        var idArray = [Int]()
        var namearray = [String]()
        var id = 0
        filePaths.forEach { (file) in
            if file.substring(to: file.index(file.startIndex, offsetBy: 1)) == character{
                let name = file.substring(from: file.index(file.startIndex, offsetBy: 5)).substring(to: file.index(file.endIndex, offsetBy: -9 ))
                print(name)
                namearray.append(name)
                idArray.append(id)
            }
            id = id + 1
        }
        return (namearray, idArray)
    }
    
    func nameOfchapteratIndex (_ index : Int) -> String {
        return chapters_NAME[index]
    }
    
    func titleForFileWith (_ index: Int) -> String {
        var pathh = (filePaths[index] as NSString?)!
        pathh = pathh.substring(to: pathh.length - 4) as NSString
       pathh = pathh.substring(from: 5) as NSString
        pathh = pathh.replacingOccurrences(of: "_", with: " ") as NSString
        return pathh as String
    }
}

