//
//  MPPlayableContentManager.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPPlayableContentManager.h"

#import <dispatch/dispatch.h>

@implementation MPPlayableContentManager
+ (instancetype)sharedContentManager
{
    static dispatch_once_t onceToken;
    static MPPlayableContentManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)reloadData
{
    
}

- (void)beginUpdates
{
    
}

- (void)endUpdates
{
    
}

@end
