//
//  RCTContactsManager.m
//  RCTContacts
//
//  Created by Jaco Groenewald on 2018/05/21.
//  Copyright © 2018 rt2zz. All rights reserved.
//
#import <Contacts/Contacts.h>
#import "RCTContactsManager.h"

@implementation ContactsManager
{
    bool isWatching;
    bool observerID;
}

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"contactsChanged",
             @"contactChanged",
     ];
}

RCT_EXPORT_METHOD(startWatching) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactsChanged:) name:CNContactStoreDidChangeNotification object:nil];
    isWatching = YES;
}

RCT_EXPORT_METHOD(stopWatching) {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    isWatching = NO;
}

RCT_EXPORT_METHOD(startWatchingContact) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contactChanged:) name:@"contactChanged" object:nil];
    isWatching = YES;
}

- (void)contactChanged:(NSNotification *)notification
{
    NSDictionary *contact = notification.userInfo;
    if (isWatching) {
        [self sendEventWithName:@"contactChanged" body:contact];
    }
}

- (void)contactsChanged:(NSNotification *)notification
{
    if (isWatching) {
        [self sendEventWithName:@"contactsChanged" body:nil];
    }
}

@end

