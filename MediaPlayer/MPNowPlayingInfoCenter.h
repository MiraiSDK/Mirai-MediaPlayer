//
//  MPNowPlayingInfoCenter.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@interface MPNowPlayingInfoCenter : NSObject
+ (MPNowPlayingInfoCenter *)defaultCenter;
@property (copy) NSDictionary *nowPlayingInfo;
@end

MP_EXTERN NSString *const MPNowPlayingInfoPropertyElapsedPlaybackTime;
MP_EXTERN NSString *const MPNowPlayingInfoPropertyPlaybackRate;
MP_EXTERN NSString *const MPNowPlayingInfoPropertyPlaybackQueueIndex;
MP_EXTERN NSString *const MPNowPlayingInfoPropertyPlaybackQueueCount;
MP_EXTERN NSString *const MPNowPlayingInfoPropertyChapterNumber;
MP_EXTERN NSString *const MPNowPlayingInfoPropertyChapterCount;
