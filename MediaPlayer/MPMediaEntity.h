//
//  MPMediaEntity.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPMediaLibrary;

@interface MPMediaEntity : NSObject <NSSecureCoding>
+ (BOOL)canFilterByProperty:(NSString *)property;
- (id)valueForProperty:(NSString *)property;
- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void (^)(NSString *property, id value, BOOL *stop))block;

@end
