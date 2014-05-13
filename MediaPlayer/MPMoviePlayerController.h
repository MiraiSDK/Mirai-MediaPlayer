//
//  MPMoviePlayerController.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MPMediaPlayback.h>
#import <UIKit/UIKit.h>

@class MPMovieAccessLog, MPMovieErrorLog;

// -----------------------------------------------------------------------------
// Types

enum {
    MPMovieScalingModeNone,       // No scaling
    MPMovieScalingModeAspectFit,  // Uniform scale until one dimension fits
    MPMovieScalingModeAspectFill, // Uniform scale until the movie fills the visible bounds. One dimension may have clipped contents
    MPMovieScalingModeFill        // Non-uniform scale. Both render dimensions will exactly match the visible bounds
};
typedef NSInteger MPMovieScalingMode;

enum {
    MPMoviePlaybackStateStopped,
    MPMoviePlaybackStatePlaying,
    MPMoviePlaybackStatePaused,
    MPMoviePlaybackStateInterrupted,
    MPMoviePlaybackStateSeekingForward,
    MPMoviePlaybackStateSeekingBackward
};
typedef NSInteger MPMoviePlaybackState;

enum {
    MPMovieLoadStateUnknown        = 0,
    MPMovieLoadStatePlayable       = 1 << 0,
    MPMovieLoadStatePlaythroughOK  = 1 << 1, // Playback will be automatically started in this state when shouldAutoplay is YES
    MPMovieLoadStateStalled        = 1 << 2, // Playback will be automatically paused in this state, if started
};
typedef NSInteger MPMovieLoadState;

enum {
    MPMovieRepeatModeNone,
    MPMovieRepeatModeOne
};
typedef NSInteger MPMovieRepeatMode;

enum {
    MPMovieControlStyleNone,       // No controls
    MPMovieControlStyleEmbedded,   // Controls for an embedded view
    MPMovieControlStyleFullscreen, // Controls for fullscreen playback
    
    MPMovieControlStyleDefault = MPMovieControlStyleEmbedded
};
typedef NSInteger MPMovieControlStyle;

enum {
    MPMovieFinishReasonPlaybackEnded,
    MPMovieFinishReasonPlaybackError,
    MPMovieFinishReasonUserExited
};
typedef NSInteger MPMovieFinishReason;

// -----------------------------------------------------------------------------
// Movie Property Types

enum {
    MPMovieMediaTypeMaskNone  = 0,
    MPMovieMediaTypeMaskVideo = 1 << 0,
    MPMovieMediaTypeMaskAudio = 1 << 1
};
typedef NSInteger MPMovieMediaTypeMask;

enum {
    MPMovieSourceTypeUnknown,
    MPMovieSourceTypeFile,     // Local or progressively downloaded network content
    MPMovieSourceTypeStreaming // Live or on-demand streaming content
};
typedef NSInteger MPMovieSourceType;

@interface MPMoviePlayerController : NSObject <MPMediaPlayback>
- (id)initWithContentURL:(NSURL *)url;

@property(nonatomic, copy) NSURL *contentURL;
@property(nonatomic, readonly) UIView *view;
@property(nonatomic, readonly) UIView *backgroundView;
@property(nonatomic, readonly) MPMoviePlaybackState playbackState;
@property(nonatomic, readonly) MPMovieLoadState loadState;
@property(nonatomic) MPMovieControlStyle controlStyle;
@property(nonatomic) MPMovieRepeatMode repeatMode;
@property(nonatomic) BOOL shouldAutoplay;
@property(nonatomic, getter=isFullscreen) BOOL fullscreen;
- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated;
@property(nonatomic) MPMovieScalingMode scalingMode;
@property(nonatomic, readonly) BOOL readyForDisplay;

@end

@interface MPMoviePlayerController (MPMovieProperties)
@property(nonatomic, readonly) MPMovieMediaTypeMask movieMediaTypes;
@property(nonatomic) MPMovieSourceType movieSourceType;
@property(nonatomic, readonly) NSTimeInterval duration;
@property(nonatomic, readonly) NSTimeInterval playableDuration;
@property(nonatomic, readonly) CGSize naturalSize;
@property(nonatomic) NSTimeInterval initialPlaybackTime;
@property(nonatomic) NSTimeInterval endPlaybackTime;
@property(nonatomic) BOOL allowsAirPlay;
@property(nonatomic, readonly, getter=isAirPlayVideoActive) BOOL airPlayVideoActive;
@end

MP_EXTERN NSString *const MPMoviePlayerScalingModeDidChangeNotification;
MP_EXTERN NSString *const MPMoviePlayerPlaybackDidFinishNotification;
MP_EXTERN NSString *const MPMoviePlayerPlaybackDidFinishReasonUserInfoKey;
MP_EXTERN NSString *const MPMoviePlayerPlaybackStateDidChangeNotification;
MP_EXTERN NSString *const MPMoviePlayerLoadStateDidChangeNotification;
MP_EXTERN NSString *const MPMoviePlayerNowPlayingMovieDidChangeNotification;

MP_EXTERN NSString *const MPMoviePlayerWillEnterFullscreenNotification;
MP_EXTERN NSString *const MPMoviePlayerDidEnterFullscreenNotification;
MP_EXTERN NSString *const MPMoviePlayerWillExitFullscreenNotification;
MP_EXTERN NSString *const MPMoviePlayerDidExitFullscreenNotification;
MP_EXTERN NSString *const MPMoviePlayerFullscreenAnimationDurationUserInfoKey;
MP_EXTERN NSString *const MPMoviePlayerFullscreenAnimationCurveUserInfoKey;

MP_EXTERN NSString *const MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification;

MP_EXTERN NSString *const MPMoviePlayerReadyForDisplayDidChangeNotification;

MP_EXTERN NSString *const MPMovieMediaTypesAvailableNotification;
MP_EXTERN NSString *const MPMovieSourceTypeAvailableNotification;
MP_EXTERN NSString *const MPMovieDurationAvailableNotification;
MP_EXTERN NSString *const MPMovieNaturalSizeAvailableNotification;

enum {
    MPMovieTimeOptionNearestKeyFrame,
    MPMovieTimeOptionExact
};
typedef NSInteger MPMovieTimeOption;


@interface MPMoviePlayerController (MPMoviePlayerThumbnailGeneration)
- (UIImage *)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option;// NS_DEPRECATED_IOS(3_2, 7_0);
- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option;
- (void)cancelAllThumbnailImageRequests;

@end

MP_EXTERN NSString *const MPMoviePlayerThumbnailImageRequestDidFinishNotification;
MP_EXTERN NSString *const MPMoviePlayerThumbnailImageKey;
MP_EXTERN NSString *const MPMoviePlayerThumbnailTimeKey;
MP_EXTERN NSString *const MPMoviePlayerThumbnailErrorKey;

@interface MPMoviePlayerController (MPMoviePlayerTimedMetadataAdditions)
- (NSArray *)timedMetadata;
@end

@interface MPTimedMetadata : NSObject
@property(nonatomic, readonly) NSString *key;
@property(nonatomic, readonly) NSString *keyspace;
@property(nonatomic, readonly) id value;
@property(nonatomic, readonly) NSTimeInterval timestamp;
@property(nonatomic, readonly) NSDictionary *allMetadata;
@end

MP_EXTERN NSString *const MPMoviePlayerTimedMetadataUpdatedNotification;
MP_EXTERN NSString *const MPMoviePlayerTimedMetadataUserInfoKey;

MP_EXTERN NSString *const MPMoviePlayerTimedMetadataKeyName;
MP_EXTERN NSString *const MPMoviePlayerTimedMetadataKeyInfo;
MP_EXTERN NSString *const MPMoviePlayerTimedMetadataKeyMIMEType;
MP_EXTERN NSString *const MPMoviePlayerTimedMetadataKeyDataType;
MP_EXTERN NSString *const MPMoviePlayerTimedMetadataKeyLanguageCode;

@interface MPMoviePlayerController (MPMovieLogging)
@property (nonatomic, readonly) MPMovieAccessLog *accessLog;
@property (nonatomic, readonly) MPMovieErrorLog *errorLog;
@end

@interface MPMovieAccessLog : NSObject <NSCopying>
@property (nonatomic, readonly) NSData *extendedLogData;
@property (nonatomic, readonly) NSStringEncoding extendedLogDataStringEncoding;
@property (nonatomic, readonly) NSArray *events;
@end

@interface MPMovieErrorLog : NSObject <NSCopying>
@property (nonatomic, readonly) NSData *extendedLogData;
@property (nonatomic, readonly) NSStringEncoding extendedLogDataStringEncoding;
@property (nonatomic, readonly) NSArray *events;
@end


@interface MPMovieAccessLogEvent : NSObject <NSCopying>
@property (nonatomic, readonly) NSUInteger numberOfSegmentsDownloaded;
@property (nonatomic, readonly) NSDate *playbackStartDate;
@property (nonatomic, readonly) NSString *URI;
@property (nonatomic, readonly) NSString *serverAddress;
@property (nonatomic, readonly) NSUInteger numberOfServerAddressChanges;
@property (nonatomic, readonly) NSString *playbackSessionID;
@property (nonatomic, readonly) NSTimeInterval playbackStartOffset;
@property (nonatomic, readonly) NSTimeInterval segmentsDownloadedDuration;
@property (nonatomic, readonly) NSTimeInterval durationWatched;
@property (nonatomic, readonly) NSInteger numberOfStalls;
@property (nonatomic, readonly) int64_t numberOfBytesTransferred;
@property (nonatomic, readonly) double observedBitrate;
@property (nonatomic, readonly) double indicatedBitrate;
@property (nonatomic, readonly) NSInteger numberOfDroppedVideoFrames;
@end

@interface MPMovieErrorLogEvent : NSObject <NSCopying>
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSString *URI;
@property (nonatomic, readonly) NSString *serverAddress;
@property (nonatomic, readonly) NSString *playbackSessionID;
@property (nonatomic, readonly) NSInteger errorStatusCode;
@property (nonatomic, readonly) NSString *errorDomain;
@property (nonatomic, readonly) NSString *errorComment;

@end

// -----------------------------------------------------------------------------
// Deprecated methods and properties
// These will be removed in a future release of iOS

typedef enum {
    MPMovieControlModeDefault,
    MPMovieControlModeVolumeOnly,
    MPMovieControlModeHidden
} MPMovieControlMode;

@interface MPMoviePlayerController (MPMoviePlayerDeprecated)
@property(nonatomic) BOOL useApplicationAudioSession;// NS_DEPRECATED_IOS(3_2, 6_0);
- (void)setBackgroundColor:(UIColor *)backgroundColor;// NS_DEPRECATED_IOS(2_0, 3_2);
- (UIColor *)backgroundColor;// NS_DEPRECATED_IOS(2_0, 3_2);
- (void)setMovieControlMode:(MPMovieControlMode)movieControlMode;// NS_DEPRECATED_IOS(2_0, 3_2);
- (MPMovieControlMode)movieControlMode;// NS_DEPRECATED_IOS(2_0, 3_2);

@end

MP_EXTERN NSString *const MPMoviePlayerContentPreloadDidFinishNotification;// NS_DEPRECATED_IOS(2_0, 3_2);

