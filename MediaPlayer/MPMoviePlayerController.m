//
//  MPMoviePlayerController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMoviePlayerController.h"
#import "MPMediaView.h"
#import <TNJavaHelper/TNJavaHelper.h>

#import <GLES2/gl2.h>
#import <GLES2/gl2ext.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>

#import <QuartzCore/QuartzCore.h>

#import "MPMovieControlView.h"

@interface MPMoviePlayerController ()
@property(nonatomic, readwrite) MPMoviePlaybackState playbackState;

@property(nonatomic, readonly) MPMovieMediaTypeMask movieMediaTypes;
@property(nonatomic) MPMovieSourceType movieSourceType;
@property(nonatomic, readonly) NSTimeInterval duration;
@property(nonatomic, readonly) NSTimeInterval playableDuration;
@property(nonatomic, readonly) CGSize naturalSize;
@property(nonatomic) NSTimeInterval initialPlaybackTime;
@property(nonatomic) NSTimeInterval endPlaybackTime;
@property(nonatomic) BOOL allowsAirPlay;
@property(nonatomic, readonly, getter=isAirPlayVideoActive) BOOL airPlayVideoActive;

@property (nonatomic, readonly) MPMovieAccessLog *accessLog;
@property (nonatomic, readonly) MPMovieErrorLog *errorLog;

@property(nonatomic) BOOL useApplicationAudioSession;// NS_DEPRECATED_IOS(3_2, 6_0);

@end

@implementation MPMoviePlayerController {
    jobject _mediaPlayer;
    jclass _mediaPlayerClass;
    
    jobject _surfaceTexture;
}
@synthesize currentPlaybackTime = _currentPlaybackTime;
@synthesize currentPlaybackRate = _currentPlaybackRate;
@synthesize view = _view;
@synthesize isPreparedToPlay = _isPreparedToPlay;

- (id)initWithContentURL:(NSURL *)url
{
    NSParameterAssert(url);
    
    self = [super init];
    if (self) {
        
        _contentURL = [url copy];
        _shouldAutoplay = YES;
        _playbackState = MPMoviePlaybackStateStopped;
        
        BOOL isFileExist = [[NSFileManager defaultManager] fileExistsAtPath:url.path isDirectory:NULL];
        if (!isFileExist) {
            NSLog(@"[MoviePlayer] file is not exist:%@",url);
        } else {
            
            [self createJavaMediaPlayer];
            
            MPMediaView *v = [[MPMediaView alloc] initWithFrame:CGRectMake(0, 0, 500, 500) aMediaPlayer:_mediaPlayer moviePlayerController:self];
            _view = v;
            
            [self setJavaDataSource:url];
            
        }
    }
    return self;
}

- (void)dealloc
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    (*env)->DeleteLocalRef(env, _mediaPlayer);
    (*env)->DeleteLocalRef(env, _mediaPlayerClass);
}

- (void)createJavaMediaPlayer
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    // create JAVA MediaPlayer object
    
    jclass class = (*env)->FindClass(env,"android/media/MediaPlayer");
    if (class == NULL) {
        NSLog(@"class not found: %@",@"android/media/MediaPlayer");
        return;
    }
    _mediaPlayerClass = (*env)->NewGlobalRef(env,class);
    
    jmethodID mid = (*env)->GetMethodID(env,class,"<init>","()V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"init  ()V");
        return;
    }
    
    jobject object = (*env)->NewObject(env,class,mid);
    
    if (object == NULL) {
        NSLog(@"create object failed");
        return;
    }
    
    _mediaPlayer = (*env)->NewGlobalRef(env,object);
}

- (void)setJavaDataSource:(NSURL *)url
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    jmethodID mid = (*env)->GetMethodID(env,_mediaPlayerClass,"setDataSource","(Ljava/lang/String;)V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"setDataSource");
        return;
    }
    
    jstring path = (*env)->NewStringUTF(env,url.path.UTF8String);
    
    (*env)->CallVoidMethod(env,_mediaPlayer,mid,path);
    
}

- (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated
{
    
}

#pragma mark - MPMediaPlayback
- (void)prepareToPlay
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];

    jmethodID mid = (*env)->GetMethodID(env,_mediaPlayerClass,"prepare","()V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"prepare ()V");
        return;
    }
    
    (*env)->CallVoidMethod(env, _mediaPlayer, mid);
    
    _isPreparedToPlay = YES;
}

- (BOOL)isPreparedToPlay
{
    return _isPreparedToPlay;
}

- (void)play
{
    if (![self isPreparedToPlay]) {
        [self prepareToPlay];
    }
    
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];

    jmethodID mid = (*env)->GetMethodID(env,_mediaPlayerClass,"start","()V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"start ()V");
        return;
    }
    (*env)->CallVoidMethod(env, _mediaPlayer, mid);
    
    self.playbackState = MPMoviePlaybackStatePlaying;
}

- (void)pause
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    jmethodID mid = (*env)->GetMethodID(env,_mediaPlayerClass,"pause","()V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"pause ()V");
        return;
    }
    (*env)->CallVoidMethod(env, _mediaPlayer, mid);
    
    self.playbackState = MPMoviePlaybackStatePaused;
}

- (void)stop
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    jmethodID mid = (*env)->GetMethodID(env,_mediaPlayerClass,"stop","()V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"stop ()V");
        return;
    }
    (*env)->CallVoidMethod(env, _mediaPlayer, mid);

    self.playbackState = MPMoviePlaybackStateStopped;
}

// The current playback time of the now playing item in seconds.
- (NSTimeInterval)currentPlaybackTime
{
    return 0.0;
}

- (void)setCurrentPlaybackTime:(NSTimeInterval)currentPlaybackTime
{
    
}

-(float)currentPlaybackRate
{
    return 0.0f;
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

