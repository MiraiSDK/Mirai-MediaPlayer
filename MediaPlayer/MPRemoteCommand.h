//
//  MPRemoteCommand.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPRemoteCommandEvent;

typedef NS_ENUM(NSInteger, MPRemoteCommandHandlerStatus) {
    MPRemoteCommandHandlerStatusSuccess        = 0,
    MPRemoteCommandHandlerStatusNoSuchContent  = 100,
    MPRemoteCommandHandlerStatusCommandFailed  = 200
};

@interface MPRemoteCommand : NSObject
@property (nonatomic, assign, getter = isEnabled) BOOL enabled;
- (void)addTarget:(id)target action:(SEL)action;
- (void)removeTarget:(id)target action:(SEL)action;
- (void)removeTarget:(id)target;
- (id)addTargetWithHandler:(MPRemoteCommandHandlerStatus(^)(MPRemoteCommandEvent *event))handler;

@end

@interface MPSkipIntervalCommand : MPRemoteCommand
@property (nonatomic, copy) NSArray *preferredIntervals;
@end

@interface MPFeedbackCommand : MPRemoteCommand
@property (nonatomic, assign, getter = isActive) BOOL active;
@property (nonatomic, copy) NSString *localizedTitle;
@end

@interface MPRatingCommand : MPRemoteCommand
@property (nonatomic, assign) float minimumRating;
@property (nonatomic, assign) float maximumRating;
@end

@interface MPChangePlaybackRateCommand : MPRemoteCommand
@property (nonatomic, copy) NSArray *supportedPlaybackRates;

@end
