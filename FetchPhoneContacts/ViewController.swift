//
//  ViewController.swift
//  FetchPhoneContacts
//
//  Created by Neil Francis Hipona on 09/12/2015.
//  Copyright © 2015 NFerocious. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Request grant access
        ContactsManager.sharedManager.requestAutorizationForContactsAddressBook { (granted, e) -> Void in
            
            if granted {
                
                // Fetch contacts when granted
                ContactsManager.sharedManager.fetchValidAddressBookContacts({ (contacts, e) -> Void in
                    
                    print("fetchValidAddressBookContacts: \(contacts)")
                    
                    // Loop through contatcs
                    if let contacts = contacts {
                        for contact in contacts {
                            
                            var phoneNumbers: [String] = []
                            for phoneNumber in contact.phoneNumbers {
                                let value = phoneNumber.value as! CNPhoneNumber
                                phoneNumbers.append(value.stringValue)
                            }
                            
                            var emailAddresses: [String] = []
                            for emailAddress in contact.emailAddresses {
                                let value = emailAddress.value as! String
                                emailAddresses.append(value)
                            }
                            
                            if let imageData = contact.imageData {
                                let image = UIImage(data: imageData)
                                
                                print("image: \(image)")
                            }
                            
                            // Lets log
                            
                            print("identifier: \(contact.identifier), givenName: \(contact.givenName), middleName: \(contact.middleName), familyName: \(contact.familyName), phoneNumbers: \(phoneNumbers), emailAddresses: \(emailAddresses)\n")
                        }
                    }
                })
            }
        }
    }
    
}

