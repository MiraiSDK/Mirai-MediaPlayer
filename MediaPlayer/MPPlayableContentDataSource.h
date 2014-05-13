//
//  MPPlayableContentDataSource.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPContentItem;

@protocol MPPlayableContentDataSource <NSObject>
@optional
- (void)beginLoadingChildItemsAtIndexPath:(NSIndexPath *)indexPath completionHandler:(void(^)(NSError *))completionHandler;
- (BOOL)childItemsDisplayPlaybackProgressAtIndexPath:(NSIndexPath *)indexPath;

@required
- (NSInteger)numberOfChildItemsAtIndexPath:(NSIndexPath *)indexPath;
- (MPContentItem *)contentItemAtIndexPath:(NSIndexPath *)indexPath;
@end
