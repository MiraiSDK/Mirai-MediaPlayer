//
//  MPRemoteCommandCenter.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPRemoteCommand, MPSkipIntervalCommand, MPRatingCommand, MPChangePlaybackRateCommand, MPFeedbackCommand;

@interface MPRemoteCommandCenter : NSObject
// Playback Commands
@property (nonatomic, readonly) MPRemoteCommand *pauseCommand;
@property (nonatomic, readonly) MPRemoteCommand *playCommand;
@property (nonatomic, readonly) MPRemoteCommand *stopCommand;
@property (nonatomic, readonly) MPRemoteCommand *togglePlayPauseCommand;

// Previous/Next Track Commands
@property (nonatomic, readonly) MPRemoteCommand *nextTrackCommand;
@property (nonatomic, readonly) MPRemoteCommand *previousTrackCommand;

// Skip Interval Commands
@property (nonatomic, readonly) MPSkipIntervalCommand *skipForwardCommand;
@property (nonatomic, readonly) MPSkipIntervalCommand *skipBackwardCommand;

// Seek Commands
@property (nonatomic, readonly) MPRemoteCommand *seekForwardCommand;
@property (nonatomic, readonly) MPRemoteCommand *seekBackwardCommand;

// Rating Command
@property (nonatomic, readonly) MPRatingCommand *ratingCommand;

// Playback Commands
@property (nonatomic, readonly) MPChangePlaybackRateCommand *changePlaybackRateCommand;

// Feedback Commands
@property (nonatomic, readonly) MPFeedbackCommand *likeCommand;
@property (nonatomic, readonly) MPFeedbackCommand *dislikeCommand;
@property (nonatomic, readonly) MPFeedbackCommand *bookmarkCommand;

+ (MPRemoteCommandCenter *)sharedCommandCenter;

@end
