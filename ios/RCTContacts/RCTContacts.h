#import <React/RCTBridgeModule.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import <React/RCTEventEmitter.h>

@interface RCTContacts : NSObject <RCTBridgeModule, CNContactViewControllerDelegate>

@end
