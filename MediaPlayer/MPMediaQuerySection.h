//
//  MPMediaQuerySection.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@interface MPMediaQuerySection : NSObject <NSSecureCoding, NSCopying>
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) NSRange range;

@end
