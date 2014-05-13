//
//  MPMediaItem.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaEntity.h>

@class UIImage;

typedef NS_OPTIONS(NSUInteger, MPMediaType) {
    // audio
    MPMediaTypeMusic                                   = 1 << 0,
    MPMediaTypePodcast                                 = 1 << 1,
    MPMediaTypeAudioBook                               = 1 << 2,
    MPMediaTypeAudioITunesU  = 1 << 3,
    MPMediaTypeAnyAudio                                = 0x00ff,
    
    // video (available in iOS 5.0)
    MPMediaTypeMovie                                   = 1 << 8,
    MPMediaTypeTVShow         = 1 << 9,
    MPMediaTypeVideoPodcast  = 1 << 10,
    MPMediaTypeMusicVideo    = 1 << 11,
    MPMediaTypeVideoITunesU  = 1 << 12,
    MPMediaTypeHomeVideo     = 1 << 13,
    MPMediaTypeAnyVideo      = 0xff00,
    
    MPMediaTypeAny                                     = ~0UL
};

@interface MPMediaItem : MPMediaEntity

@end

@interface MPMediaItemArtwork : NSObject
- (id)initWithImage:(UIImage *)image;

// Returns the artwork image for an item at a given size (in points).
- (UIImage *)imageWithSize:(CGSize)size;

@property(nonatomic, readonly) CGRect bounds; // The bounds of the full size image (in points).
@property(nonatomic, readonly) CGRect imageCropRect; // The actual content area of the artwork, in the bounds of the full size image (in points).

@end

MP_EXTERN NSString *const MPMediaItemPropertyPersistentID;     // @"persistentID",        NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyMediaType;        // @"mediaType",           NSNumber of MPMediaType (NSInteger),          filterable
MP_EXTERN NSString *const MPMediaItemPropertyTitle;            // @"title",               NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTitle;       // @"albumTitle",          NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumPersistentID;
// @"albumPID",            NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyArtist;           // @"artist",              NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyArtistPersistentID;
// @"artistPID",           NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumArtist;      // @"albumArtist",         NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumArtistPersistentID;
// @"albumArtistPID",      NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyGenre;            // @"genre",               NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyGenrePersistentID;
// @"genrePID",            NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyComposer;         // @"composer",            NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyComposerPersistentID;
// @"composerPID",         NSNumber of int64_t (long long),              filterable
MP_EXTERN NSString *const MPMediaItemPropertyPlaybackDuration; // @"playbackDuration",    NSNumber of NSTimeInterval (double)
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTrackNumber; // @"albumTrackNumber",    NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTrackCount;  // @"albumTrackCount",     NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyDiscNumber;       // @"discNumber",          NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyDiscCount;        // @"discCount",           NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyArtwork;          // @"artwork",             MPMediaItemArtwork
MP_EXTERN NSString *const MPMediaItemPropertyLyrics;           // @"lyrics",              NSString
MP_EXTERN NSString *const MPMediaItemPropertyIsCompilation;    // @"isCompilation",       NSNumber of BOOL,                             filterable
MP_EXTERN NSString *const MPMediaItemPropertyReleaseDate;
// @"releaseDate",         NSDate
MP_EXTERN NSString *const MPMediaItemPropertyBeatsPerMinute;
// @"beatsPerMinute",      NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyComments;
// @"comments",            NSString
MP_EXTERN NSString *const MPMediaItemPropertyAssetURL;
// @"assetURL",            NSURL
MP_EXTERN NSString *const MPMediaItemPropertyIsCloudItem;
// @"isCloudItem",         NSNumber of BOOL,                             filterable

// Podcast properties
MP_EXTERN NSString *const MPMediaItemPropertyPodcastTitle;     // @"podcastTitle",        NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyPodcastPersistentID;
// @"podcastPID",          NSNumber of int64_t (long long),              filterable

// User properties
MP_EXTERN NSString *const MPMediaItemPropertyPlayCount;        // @"playCount",           NSNumber of NSUInteger                        filterable
MP_EXTERN NSString *const MPMediaItemPropertySkipCount;        // @"skipCount",           NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyRating;           // @"rating",              NSNumber of NSUInteger, 0...5
MP_EXTERN NSString *const MPMediaItemPropertyLastPlayedDate;   // @"lastPlayedDate",      NSDate
MP_EXTERN NSString *const MPMediaItemPropertyUserGrouping;
// @"userGrouping",        NSString
MP_EXTERN NSString *const MPMediaItemPropertyBookmarkTime;
// @"bookmarkTime",        NSNumber of NSTimeInterval (double)


