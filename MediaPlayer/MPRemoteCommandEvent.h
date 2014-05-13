//
//  MPRemoteCommandEvent.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPRemoteCommand;

@interface MPRemoteCommandEvent : NSObject
@property (nonatomic, readonly) MPRemoteCommand *command;
@property (nonatomic, readonly) NSTimeInterval timestamp;
@end

@interface MPSkipIntervalCommandEvent : MPRemoteCommandEvent
@property (nonatomic, readonly) NSTimeInterval interval;
@end

typedef NS_ENUM(NSUInteger, MPSeekCommandEventType) {
    MPSeekCommandEventTypeBeginSeeking,
    MPSeekCommandEventTypeEndSeeking
};

@interface MPSeekCommandEvent : MPRemoteCommandEvent
@property (nonatomic, readonly) MPSeekCommandEventType type;
@end

@interface MPRatingCommandEvent : MPRemoteCommandEvent
@property (nonatomic, readonly) float rating;
@end

@interface MPChangePlaybackRateCommandEvent : MPRemoteCommandEvent
@property (nonatomic, readonly) float playbackRate;

@end

@interface MPFeedbackCommandEvent : MPRemoteCommandEvent
@property (nonatomic, readonly, getter = isNegative) BOOL negative;
@end

