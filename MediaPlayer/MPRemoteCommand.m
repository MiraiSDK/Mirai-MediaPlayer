//
//  MPRemoteCommand.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPRemoteCommand.h"

@implementation MPRemoteCommand

- (void)addTarget:(id)target action:(SEL)action
{
    
}

- (void)removeTarget:(id)target action:(SEL)action
{
    
}

- (void)removeTarget:(id)target
{
    
}

- (id)addTargetWithHandler:(MPRemoteCommandHandlerStatus(^)(MPRemoteCommandEvent *event))handler
{
    return nil;
}

@end

@implementation MPSkipIntervalCommand

@end

@implementation MPFeedbackCommand


@end

@implementation MPRatingCommand

@end

@implementation MPChangePlaybackRateCommand

@end