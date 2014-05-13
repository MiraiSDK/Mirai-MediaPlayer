//
//  MPMusicPlayerController.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItemCollection.h>
#import <MediaPlayer/MPMediaItem.h>
#import <MediaPlayer/MPMediaQuery.h>
#import <MediaPlayer/MPMediaPlayback.h>

@class MPMediaItem, MPMediaQuery, MPMusicPlayerControllerInternal;

enum {
    MPMusicPlaybackStateStopped,
    MPMusicPlaybackStatePlaying,
    MPMusicPlaybackStatePaused,
    MPMusicPlaybackStateInterrupted,
    MPMusicPlaybackStateSeekingForward,
    MPMusicPlaybackStateSeekingBackward
};
typedef NSInteger MPMusicPlaybackState;

enum {
    MPMusicRepeatModeDefault, // the user's preference for repeat mode
    MPMusicRepeatModeNone,
    MPMusicRepeatModeOne,
    MPMusicRepeatModeAll
};
typedef NSInteger MPMusicRepeatMode;

enum {
    MPMusicShuffleModeDefault, // the user's preference for shuffle mode
    MPMusicShuffleModeOff,
    MPMusicShuffleModeSongs,
    MPMusicShuffleModeAlbums
};
typedef NSInteger MPMusicShuffleMode;

@interface MPMusicPlayerController : NSObject <MPMediaPlayback>
+ (MPMusicPlayerController *)applicationMusicPlayer;
+ (MPMusicPlayerController *)iPodMusicPlayer;
@end

@interface MPMusicPlayerController (MPPlaybackControl)
@property(nonatomic, readonly) MPMusicPlaybackState playbackState;
@property(nonatomic) MPMusicRepeatMode repeatMode;
@property(nonatomic) MPMusicShuffleMode shuffleMode;
@property(nonatomic) float volume;// NS_DEPRECATED_IOS(3_0, 7_0);
@property(nonatomic, copy) MPMediaItem *nowPlayingItem;
@property(nonatomic, readonly) NSUInteger indexOfNowPlayingItem;

- (void)setQueueWithQuery:(MPMediaQuery *)query;
- (void)setQueueWithItemCollection:(MPMediaItemCollection *)itemCollection;

- (void)skipToNextItem;
- (void)skipToBeginning;
- (void)skipToPreviousItem;

- (void)beginGeneratingPlaybackNotifications;
- (void)endGeneratingPlaybackNotifications;

@end

MP_EXTERN NSString *const MPMusicPlayerControllerPlaybackStateDidChangeNotification;
MP_EXTERN NSString *const MPMusicPlayerControllerNowPlayingItemDidChangeNotification;
MP_EXTERN NSString *const MPMusicPlayerControllerVolumeDidChangeNotification;
