//
//  File.swift
//  Sqlite Database
//
//  Created by Choudhary Dipika on 31/03/23.
//

import Foundation
import SQLite3

struct Model
{
    var id :Int
    var name : String
}

class Sqlite
{
    static var file : OpaquePointer?
    
    static func createFile()
    {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My Sqlite File2.db")
        sqlite3_open(x.path, &file)
        print(x.path)
        print("File created")
        createTable()
    }
    
    static func createTable()
    {
        let q = "Create Table if not exists Students (name text,id integer)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        print("Table created")
        sqlite3_step(table)
    }
    
    static func addData(id:Int,name:String)
    {
        let q = "insert into Students values ('\(name)',\(id))"
        var data : OpaquePointer?
        sqlite3_prepare(file, q, -1, &data, nil)
        print("Data added")
        sqlite3_step(data)
    }
    
    static func getData()->[Model]
    {
        var arr = [Model]()
        let q = "select name,id from Students"
        var get : OpaquePointer?
        sqlite3_prepare(file, q, -1, &get, nil)
        
        while sqlite3_step(get) == SQLITE_ROW
        {
            let id = sqlite3_column_int64(get, 1)
            print("id = \(id);",terminator: "")
            
            if let cString = sqlite3_column_text(get, 0)
            {
                let name = String(cString : cString)
                arr.append(Model(id: Int(id), name: name))
            }
        }
        
        print("Get Data")
        return arr
    }
    
    static func deleteData(id:Int,name:String)
    {
      let q = "DELETE FROM Students WHERE id = \(id)"
        var table : OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Delete Data")
    }
}
