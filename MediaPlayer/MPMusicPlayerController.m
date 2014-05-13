//
//  MPMusicPlayerController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMusicPlayerController.h"

@implementation MPMusicPlayerController
@synthesize isPreparedToPlay = _isPreparedToPlay;
@synthesize currentPlaybackRate = _currentPlaybackRate;
@synthesize currentPlaybackTime = _currentPlaybackTime;

+ (MPMusicPlayerController *)applicationMusicPlayer
{
    return nil;
}

+ (MPMusicPlayerController *)iPodMusicPlayer
{
    return nil;
}

- (void)prepareToPlay
{
    
}

- (void)play
{
    
}

- (void)pause
{
    
}

- (void)stop
{
    
}

- (void)beginSeekingForward
{
    
}

- (void)beginSeekingBackward
{
    
}

- (void)endSeeking
{
    
}

@end

@implementation MPMusicPlayerController (MPPlaybackControl)
@dynamic playbackState,repeatMode,shuffleMode;
@dynamic volume,nowPlayingItem,indexOfNowPlayingItem;

- (void)setQueueWithQuery:(MPMediaQuery *)query
{
    
}

- (void)setQueueWithItemCollection:(MPMediaItemCollection *)itemCollection
{
    
}

- (void)skipToNextItem
{
    
}

- (void)skipToBeginning
{
    
}

- (void)skipToPreviousItem
{
    
}

- (void)beginGeneratingPlaybackNotifications
{
    
}

- (void)endGeneratingPlaybackNotifications
{
    
}
@end

NSString *const MPMusicPlayerControllerPlaybackStateDidChangeNotification = @"MPMusicPlayerControllerPlaybackStateDidChangeNotification";
NSString *const MPMusicPlayerControllerNowPlayingItemDidChangeNotification = @"MPMusicPlayerControllerNowPlayingItemDidChangeNotification";
NSString *const MPMusicPlayerControllerVolumeDidChangeNotification = @"MPMusicPlayerControllerVolumeDidChangeNotification";
