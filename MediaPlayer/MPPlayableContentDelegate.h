//
//  MPPlayableContentDelegate.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPPlayableContentManager, MPContentItem;

@protocol MPPlayableContentDelegate <NSObject>
@optional
- (void)playableContentManager:(MPPlayableContentManager *)contentManager
initiatePlaybackOfContentItemAtIndexPath:(NSIndexPath *)indexPath
             completionHandler:(void(^)(NSError *))completionHandler;

@end
