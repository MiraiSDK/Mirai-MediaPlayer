//
//  MPPlayableContentManager.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MPPlayableContentDataSource.h>
#import <MediaPlayer/MPPlayableContentDelegate.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@interface MPPlayableContentManager : NSObject
@property (nonatomic, weak) id<MPPlayableContentDataSource> dataSource;
@property (nonatomic, weak) id<MPPlayableContentDelegate>   delegate;

+ (instancetype)sharedContentManager;

- (void)reloadData;
- (void)beginUpdates;
- (void)endUpdates;

@end
