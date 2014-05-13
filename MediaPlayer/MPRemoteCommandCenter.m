//
//  MPRemoteCommandCenter.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPRemoteCommandCenter.h"

#import <dispatch/dispatch.h>

@implementation MPRemoteCommandCenter
+ (MPRemoteCommandCenter *)sharedCommandCenter
{
    static dispatch_once_t onceToken;
    static MPRemoteCommandCenter *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
