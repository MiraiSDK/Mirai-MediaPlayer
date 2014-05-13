//
//  MPMediaPlaylist.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItemCollection.h>

@class MPMediaItem;

enum {
    MPMediaPlaylistAttributeNone    = 0,
    MPMediaPlaylistAttributeOnTheGo = (1 << 0), // if set, the playlist was created on a device rather than synced from iTunes
    MPMediaPlaylistAttributeSmart   = (1 << 1),
    MPMediaPlaylistAttributeGenius  = (1 << 2)
};
typedef NSInteger MPMediaPlaylistAttribute;

@interface MPMediaPlaylist : MPMediaItemCollection
@end

MP_EXTERN NSString *const MPMediaPlaylistPropertyPersistentID;
MP_EXTERN NSString *const MPMediaPlaylistPropertyName;
MP_EXTERN NSString *const MPMediaPlaylistPropertyPlaylistAttributes;
MP_EXTERN NSString *const MPMediaPlaylistPropertySeedItems;

