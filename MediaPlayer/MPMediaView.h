//
//  MPMediaView.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 7/25/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPMoviePlayerController.h"
#include <jni.h>

@class MPMoviePlayerController;
@interface MPMediaView : UIView

- (id)initWithFrame:(CGRect)frame aMediaPlayer:(jobject)mediaplayer moviePlayerController:(MPMoviePlayerController *)player;
- (void)refreshPlaybackState;
- (void)updateProgress;
- (void)setControlStyle:(MPMovieControlStyle)controlStyle;

@property (nonatomic, weak) MPMoviePlayerController *player;
@end
