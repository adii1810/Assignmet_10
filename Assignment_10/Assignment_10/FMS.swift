//
//  FMS.swift
//  Assignment_10
//
//  Created by DCS on 11/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class FMS{
    static func getDocDir() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("Doc Dir: \(path[0])")
        return path[0]
    }
    
    static func getFirstList() -> [String]{
        var filelist = [String]()
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        do{
            filelist = try FileManager.default.contentsOfDirectory(atPath: paths)
            return filelist
        }catch{
            print("Error")
        }
        return filelist

    }
}
