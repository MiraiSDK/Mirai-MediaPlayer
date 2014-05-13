//
//  MPMediaLibrary.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPMediaQuery;

@interface MPMediaLibrary : NSObject <NSSecureCoding>
+ (MPMediaLibrary *)defaultMediaLibrary;

@property(nonatomic, readonly) NSDate *lastModifiedDate;

- (void)beginGeneratingLibraryChangeNotifications;
- (void)endGeneratingLibraryChangeNotifications;

@end
