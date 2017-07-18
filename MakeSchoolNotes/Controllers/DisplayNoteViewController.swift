    //
    //  DisplayNoteViewController.swift
    //  MakeSchoolNotes
    //
    //  Created by Chris Orcutt on 1/10/16.
    //  Copyright © 2016 MakeSchool. All rights reserved.
    
    //                      2
    
    import UIKit
    
    class DisplayNoteViewController: UIViewController {
        
        @IBOutlet weak var NoteTitleTextField: UITextField!
        @IBOutlet weak var NoteContentTextView: UITextView!
        
        var note : Note?
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let myNotes = note{
                NoteTitleTextField.text = myNotes.title
                NoteContentTextView.text = myNotes.content
            }
            else
            {
                NoteContentTextView.text = ""
                NoteTitleTextField.text = ""
            }
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            // let ListNotesTableViewController = segue.destination as! ListNotesTableViewController
            
            if let identifier = segue.identifier {
                
                
                if identifier == "cancel" {
                    print("Cancel button tapped")
                }
                else if identifier == "save" {
                    print("Save button tapped")
                    
                    let note = self.note ?? coreDataHelper.Newnote()
                    note.title = NoteTitleTextField.text ?? ""
                    note.content = NoteContentTextView.text ?? ""
                    note.modificationTime = Date() as NSDate
                    coreDataHelper.saveNote()
                }
                
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
    }
    
    
