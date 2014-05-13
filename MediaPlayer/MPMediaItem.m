//
//  MPMediaItem.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaItem.h"

@implementation MPMediaItem

@end

@implementation MPMediaItemArtwork

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIImage *)imageWithSize:(CGSize)size
{
    return nil;
}
@end

NSString *const MPMediaItemPropertyPersistentID  = @"persistentID";
NSString *const MPMediaItemPropertyMediaType = @"mediaType";
NSString *const MPMediaItemPropertyTitle =        @"title";
NSString *const MPMediaItemPropertyAlbumTitle =   @"albumTitle";
NSString *const MPMediaItemPropertyAlbumPersistentID  = @"albumPID";
NSString *const MPMediaItemPropertyArtist = @"artist";
NSString *const MPMediaItemPropertyArtistPersistentID = @"artistPID";
NSString *const MPMediaItemPropertyAlbumArtist = @"albumArtist";
NSString *const MPMediaItemPropertyAlbumArtistPersistentID = @"albumArtistPID";
NSString *const MPMediaItemPropertyGenre = @"genre";
NSString *const MPMediaItemPropertyGenrePersistentID = @"genrePID";
NSString *const MPMediaItemPropertyComposer = @"composer";
NSString *const MPMediaItemPropertyComposerPersistentID = @"composerPID";
NSString *const MPMediaItemPropertyPlaybackDuration = @"playbackDuration";
NSString *const MPMediaItemPropertyAlbumTrackNumber = @"albumTrackNumber";
NSString *const MPMediaItemPropertyAlbumTrackCount =  @"albumTrackCount";
NSString *const MPMediaItemPropertyDiscNumber =   @"discNumber";
NSString *const MPMediaItemPropertyDiscCount =    @"discCount";
NSString *const MPMediaItemPropertyArtwork =      @"artwork";
NSString *const MPMediaItemPropertyLyrics =       @"lyrics";
NSString *const MPMediaItemPropertyIsCompilation =@"isCompilation";
NSString *const MPMediaItemPropertyReleaseDate = @"releaseDate";
NSString *const MPMediaItemPropertyBeatsPerMinute = @"beatsPerMinute";
NSString *const MPMediaItemPropertyComments = @"comments";
NSString *const MPMediaItemPropertyAssetURL = @"assetURL";
NSString *const MPMediaItemPropertyIsCloudItem = @"isCloudItem";

// Podcast properties
NSString *const MPMediaItemPropertyPodcastTitle = @"podcastTitle";
NSString *const MPMediaItemPropertyPodcastPersistentID = @"podcastPID";

// User properties
NSString *const MPMediaItemPropertyPlayCount = @"playCount";
NSString *const MPMediaItemPropertySkipCount = @"skipCount";
NSString *const MPMediaItemPropertyRating = @"rating";
NSString *const MPMediaItemPropertyLastPlayedDate = @"lastPlayedDate";
NSString *const MPMediaItemPropertyUserGrouping = @"userGrouping";
NSString *const MPMediaItemPropertyBookmarkTime = @"bookmarkTime";
