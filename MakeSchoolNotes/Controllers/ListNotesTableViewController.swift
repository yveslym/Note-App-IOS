//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class ListNotesTableViewController: UITableViewController {
    
    
    var notes = [Note]()
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return notes.count
    }
    override public func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListNoteTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "DisplayNote" {
                print("Transitioning to the Display Note View Controller")
                
                let displaynoteviewcontroller = segue.destination as! DisplayNoteViewController
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[indexPath.row]
                displaynoteviewcontroller.note = note
            }
            else if identifier == "AddNote"
            {
                print("add note tapped")
    
            }
        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{         // function to edit tableview style
            
            coreDataHelper.deleteNote(note: notes[indexPath.row])
            notes = coreDataHelper.fetchNote()
        }
    }
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        
        self.notes = coreDataHelper.fetchNote()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = coreDataHelper.fetchNote()
    }
}
