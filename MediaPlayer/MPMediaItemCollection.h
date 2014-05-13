//
//  MPMediaItemCollection.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItem.h>

@interface MPMediaItemCollection : MPMediaEntity
+ (MPMediaItemCollection *)collectionWithItems:(NSArray *)items;

- (id)initWithItems:(NSArray *)items;

@property(nonatomic, readonly) NSArray *items;
@property(nonatomic, readonly) MPMediaItem *representativeItem;
@property(nonatomic, readonly) NSUInteger count;
@property(nonatomic, readonly) MPMediaType mediaTypes;

@end
