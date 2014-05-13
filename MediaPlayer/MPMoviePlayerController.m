//
//  MPMoviePlayerController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMoviePlayerController.h"

@implementation MPMoviePlayerController
- (id)initWithContentURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated
{
    
}
@end

@implementation MPMoviePlayerController (MPMovieProperties)


@end

@implementation MPMoviePlayerController (MPMoviePlayerThumbnailGeneration)
- (UIImage *)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option
{
    return nil;
}// NS_DEPRECATED_IOS(3_2, 7_0);

- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option
{
    
}

- (void)cancelAllThumbnailImageRequests
{
    
}
@end

@implementation MPMoviePlayerController (MPMoviePlayerTimedMetadataAdditions)
- (NSArray *)timedMetadata
{
    return nil;
}
@end

@implementation MPTimedMetadata

@end

@implementation MPMoviePlayerController (MPMovieLogging)

@end

@implementation MPMovieAccessLog
- (id)copyWithZone:(NSZone *)zone
{
    MPMovieAccessLog *copy = [[self class] init];
    return copy;
}
@end

@implementation MPMovieAccessLogEvent

- (id)copyWithZone:(NSZone *)zone
{
    MPMovieAccessLogEvent *copy = [[self class] init];
    return copy;
    
}
@end

@implementation MPMovieErrorLog
- (id)copyWithZone:(NSZone *)zone
{
    MPMovieErrorLog *copy = [[self class] init];
    return copy;
}
@end

@implementation MPMovieErrorLogEvent
- (id)copyWithZone:(NSZone *)zone
{
    MPMovieErrorLogEvent *copy = [[self class] init];
    return copy;
}
@end

@implementation MPMoviePlayerController (MPMoviePlayerDeprecated)
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    
}

- (UIColor *)backgroundColor
{
    return nil;
}

- (void)setMovieControlMode:(MPMovieControlMode)movieControlMode
{
    
}

- (MPMovieControlMode)movieControlMode
{
    return MPMovieControlModeDefault;
}

@end
NSString *const MPMoviePlayerScalingModeDidChangeNotification = @"MPMoviePlayerScalingModeDidChangeNotification";
NSString *const MPMoviePlayerPlaybackDidFinishNotification = @"MPMoviePlayerPlaybackDidFinishNotification";
NSString *const MPMoviePlayerPlaybackDidFinishReasonUserInfoKey = @"MPMoviePlayerPlaybackDidFinishReasonUserInfoKey";
NSString *const MPMoviePlayerPlaybackStateDidChangeNotification = @"MPMoviePlayerPlaybackStateDidChangeNotification";
NSString *const MPMoviePlayerLoadStateDidChangeNotification = @"MPMoviePlayerLoadStateDidChangeNotification";
NSString *const MPMoviePlayerNowPlayingMovieDidChangeNotification = @"MPMoviePlayerNowPlayingMovieDidChangeNotification";

NSString *const MPMoviePlayerWillEnterFullscreenNotification = @"MPMoviePlayerWillEnterFullscreenNotification";
NSString *const MPMoviePlayerDidEnterFullscreenNotification = @"MPMoviePlayerDidEnterFullscreenNotification";
NSString *const MPMoviePlayerWillExitFullscreenNotification = @"MPMoviePlayerWillExitFullscreenNotification";
NSString *const MPMoviePlayerDidExitFullscreenNotification = @"MPMoviePlayerDidExitFullscreenNotification";
NSString *const MPMoviePlayerFullscreenAnimationDurationUserInfoKey = @"MPMoviePlayerFullscreenAnimationDurationUserInfoKey";
NSString *const MPMoviePlayerFullscreenAnimationCurveUserInfoKey = @"MPMoviePlayerFullscreenAnimationCurveUserInfoKey";

NSString *const MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification = @"MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification";

NSString *const MPMoviePlayerReadyForDisplayDidChangeNotification = @"MPMoviePlayerReadyForDisplayDidChangeNotification";

NSString *const MPMovieMediaTypesAvailableNotification = @"MPMovieMediaTypesAvailableNotification";
NSString *const MPMovieSourceTypeAvailableNotification = @"MPMovieSourceTypeAvailableNotification";
NSString *const MPMovieDurationAvailableNotification = @"MPMovieDurationAvailableNotification";
NSString *const MPMovieNaturalSizeAvailableNotification = @"MPMovieNaturalSizeAvailableNotification";

NSString *const MPMoviePlayerThumbnailImageRequestDidFinishNotification = @"MPMoviePlayerThumbnailImageRequestDidFinishNotification";
NSString *const MPMoviePlayerThumbnailImageKey = @"MPMoviePlayerThumbnailImageKey";
NSString *const MPMoviePlayerThumbnailTimeKey = @"MPMoviePlayerThumbnailTimeKey";
NSString *const MPMoviePlayerThumbnailErrorKey = @"MPMoviePlayerThumbnailErrorKey";


NSString *const MPMoviePlayerTimedMetadataUpdatedNotification = @"MPMoviePlayerTimedMetadataUpdatedNotification";
NSString *const MPMoviePlayerTimedMetadataUserInfoKey = @"MPMoviePlayerTimedMetadataUserInfoKey";

NSString *const MPMoviePlayerTimedMetadataKeyName = @"MPMoviePlayerTimedMetadataKeyName";
NSString *const MPMoviePlayerTimedMetadataKeyInfo = @"MPMoviePlayerTimedMetadataKeyInfo";
NSString *const MPMoviePlayerTimedMetadataKeyMIMEType = @"MPMoviePlayerTimedMetadataKeyMIMEType";
NSString *const MPMoviePlayerTimedMetadataKeyDataType = @"MPMoviePlayerTimedMetadataKeyDataType";
NSString *const MPMoviePlayerTimedMetadataKeyLanguageCode = @"MPMoviePlayerTimedMetadataKeyLanguageCode";

NSString *const MPMoviePlayerContentPreloadDidFinishNotification = @"MPMoviePlayerContentPreloadDidFinishNotification";

