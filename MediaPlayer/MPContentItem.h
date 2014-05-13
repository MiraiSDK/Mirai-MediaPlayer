//
//  MPContentItem.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPMediaItemArtwork;

@interface MPContentItem : NSObject
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) MPMediaItemArtwork *artwork;
@property (nonatomic, assign, getter = isContainer) BOOL container;
@property (nonatomic, assign, getter = isPlayable) BOOL playable;
@property (nonatomic, assign) float playbackProgress;

- (instancetype)initWithIdentifier:(NSString *)identifier;
@end
