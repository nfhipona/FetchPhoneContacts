![FetchPhoneContacts](http://i.imgur.com/9Mpg638.jpg)

## FetchPhoneContacts

`FetchPhoneContacts` sample project that uses Contacts iOS 9.* Framework to fetch phones contacts.


### Features
- [x] Fetch phone contacts using the latest 'Contacts' framework
- [x] Added comments for reference

Contributions are welcome!

### About

----

## Installation

### CocoaPods

To integrate, just add the following line to your `Podfile`:

```ruby
pod '****' - not yet supported
```

## Usage

Drag and drop ContactsManager class.
Add import Contacts so the class that will use 'ContactsManager' class will know the Contact store keys


Lets request for contacts access grant

```Swift

        // Request grant access
        ContactsManager.sharedManager.requestAutorizationForContactsAddressBook { (granted, e) -> Void in
            
            if granted {
                
                // Request fetch contacts
            }
        }
        
```

Fetch contacts when user grants the app an access

```Swift

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
                    print("givenName: \(contact.givenName), middleName: \(contact.middleName), familyName: \(contact.familyName), phoneNumbers: \(phoneNumbers), emailAddresses: \(emailAddresses)\n")
                }
            }
        })

```


## License

FetchPhoneContacts is available under the MIT license, see the [LICENSE](https://github.com/nferocious76/FetchPhoneContacts/blob/master/LICENSE) file for more information.
