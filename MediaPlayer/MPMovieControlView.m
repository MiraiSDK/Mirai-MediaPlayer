//
//  MPMovieControlView.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 12/9/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMovieControlView.h"
#import "MPMoviePlayerController.h"

@interface MPMovieControlView ()
@property (nonatomic, weak) UIButton *playPauseButton;
@property (nonatomic, weak) UIButton *zoomButton;
@end

@implementation MPMovieControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIButton *playButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [playButton setTitle:@"Play" forState:UIControlStateNormal];
        [playButton sizeToFit];
        [playButton addTarget:self action:@selector(didPressedPlayPauseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:playButton];
        _playPauseButton = playButton;
        
        UIButton  *zoomButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [zoomButton setTitle:@"口" forState:UIControlStateNormal];
        [zoomButton sizeToFit];
        [zoomButton addTarget:self action:@selector(didPressedZoomButton:) forControlEvents:UIControlEventTouchUpInside];

        //[self addSubview:zoomButton];
        _zoomButton = zoomButton;
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat bottomGap = 10;
    self.playPauseButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - self.playPauseButton.bounds.size.height/2 - bottomGap);
    self.zoomButton.center = CGPointMake(self.bounds.size.width - self.zoomButton.bounds.size.width/2, self.bounds.size.height - self.zoomButton.bounds.size.height/2-bottomGap);
}

- (void)updatePlayPauseButton
{
    switch (self.player.playbackState) {
        case MPMoviePlaybackStateStopped:
        case MPMoviePlaybackStatePaused:
            [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
            
            break;
        case MPMoviePlaybackStatePlaying:
            [self.playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
            break;
        case MPMoviePlaybackStateInterrupted:
        case MPMoviePlaybackStateSeekingBackward:
        case MPMoviePlaybackStateSeekingForward:
            // FIXME: doing what?
            break;
            
        default:
            break;
    }

}

- (void)didPressedPlayPauseButton:(id)button
{
    switch (self.player.playbackState) {
        case MPMoviePlaybackStateStopped:
        case MPMoviePlaybackStatePaused:
            // do play
            [self.player play];
            break;
        case MPMoviePlaybackStatePlaying:
            // do pause
            [self.player pause];
            break;
        case MPMoviePlaybackStateInterrupted:
        case MPMoviePlaybackStateSeekingBackward:
        case MPMoviePlaybackStateSeekingForward:
            // FIXME: doing what?
            break;
            
        default:
            break;
    }
    [self updatePlayPauseButton];
}

- (void)didPressedZoomButton:(id)button
{
    
}

@end
