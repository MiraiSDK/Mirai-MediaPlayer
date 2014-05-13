//
//  MPMediaLibrary.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaLibrary.h"

#import <dispatch/dispatch.h>

@implementation MPMediaLibrary
+ (MPMediaLibrary *)defaultMediaLibrary
{
    static MPMediaLibrary *_defaultMediaLibrary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultMediaLibrary = [[self alloc] init];
    });

    return _defaultMediaLibrary;
}

- (void)beginGeneratingLibraryChangeNotifications
{
    
}

- (void)endGeneratingLibraryChangeNotifications
{
    
}

#pragma mark - NSSecureCoding
+ (BOOL)supportsSecureCoding
{
    return NO;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

@end

NSString *const MPMediaLibraryDidChangeNotification = @"MPMediaLibraryDidChangeNotification";