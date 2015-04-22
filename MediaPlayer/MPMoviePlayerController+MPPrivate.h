//
//  MPMoviePlayerController+MPPrivate.h
//  MediaPlayer
//
//  Created by TaoZeyu on 15/4/26.
//  Copyright (c) 2015年 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMoviePlayerController.h"

@interface MPMoviePlayerController (MPPrivate)
- (NSTimeInterval)currentPlaybackTime;
- (void)setCurrentPlaybackTime:(NSTimeInterval)currentPlaybackTime;
- (float)currentPlaybackRate;
@end
