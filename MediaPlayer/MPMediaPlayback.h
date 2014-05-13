//
//  MPMediaPlayback.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@protocol MPMediaPlayback <NSObject>
- (void)prepareToPlay;
@property(nonatomic, readonly) BOOL isPreparedToPlay;

- (void)play;
- (void)pause;
- (void)stop;

@property(nonatomic) NSTimeInterval currentPlaybackTime;
@property(nonatomic) float currentPlaybackRate;

- (void)beginSeekingForward;
- (void)beginSeekingBackward;
- (void)endSeeking;

@end
