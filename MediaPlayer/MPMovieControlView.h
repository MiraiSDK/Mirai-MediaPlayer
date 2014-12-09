//
//  MPMovieControlView.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 12/9/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MPMoviePlayerController;

@interface MPMovieControlView : UIView
@property (nonatomic, weak) MPMoviePlayerController *player;

@end
