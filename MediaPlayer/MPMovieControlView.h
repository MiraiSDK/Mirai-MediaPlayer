//
//  MPMovieControlView.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 12/9/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPMoviePlayerController.h"

@class MPMoviePlayerController;

@interface MPMovieControlView : UIView

- (void)setControlStyle:(MPMovieControlStyle)controlStyle;
- (void)onTouchScreen;
- (void)refreshPlaybackState;
- (void)updateProgress;
- (BOOL)panelAreaInclude:(CGPoint)location;

@property (nonatomic, weak) MPMoviePlayerController *player;

@end
