//
//  coreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Yves Songolo on 7/17/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class coreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here

   static func Newnote()->Note{
        
    let mynote: Note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
    
        return mynote
    }
    
    static func saveNote(){
        
        do{
            try managedContext.save()
        }
        catch let error as NSError{
            print ("cannot add Note In the CoreData \(error)")
        }
        }
   
    static func deleteNote( note: Note){
        
        let mynote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext)
        managedContext.delete(mynote)
    }
    
    static func fetchNote()->[Note]{
        let fetchNote = NSFetchRequest<Note>(entityName: "Note")
        
        do{
            let result = try managedContext.fetch(fetchNote)
            return result
        }catch let error as NSError{
            print("cannot retrieve note \(error)")
        }
        return []
        }
    
    }

    

    
    
