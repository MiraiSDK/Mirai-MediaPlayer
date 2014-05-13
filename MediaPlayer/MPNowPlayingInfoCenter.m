//
//  MPNowPlayingInfoCenter.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPNowPlayingInfoCenter.h"

@implementation MPNowPlayingInfoCenter
+ (MPNowPlayingInfoCenter *)defaultCenter
{
    return nil;
}

@end

NSString *const MPNowPlayingInfoPropertyElapsedPlaybackTime = @"MPNowPlayingInfoPropertyElapsedPlaybackTime";
NSString *const MPNowPlayingInfoPropertyPlaybackRate = @"MPNowPlayingInfoPropertyPlaybackRate";
NSString *const MPNowPlayingInfoPropertyPlaybackQueueIndex = @"MPNowPlayingInfoPropertyPlaybackQueueIndex";
NSString *const MPNowPlayingInfoPropertyPlaybackQueueCount = @"MPNowPlayingInfoPropertyPlaybackQueueCount";
NSString *const MPNowPlayingInfoPropertyChapterNumber = @"MPNowPlayingInfoPropertyChapterNumber";
NSString *const MPNowPlayingInfoPropertyChapterCount = @"MPNowPlayingInfoPropertyChapterCount";
