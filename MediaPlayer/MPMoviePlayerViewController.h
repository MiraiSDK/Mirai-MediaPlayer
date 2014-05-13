//
//  MPMoviePlayerViewController.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <UIKit/UIViewController.h>

@class MPMoviePlayerController;

@interface MPMoviePlayerViewController : UIViewController
- (id)initWithContentURL:(NSURL *)contentURL;
@property(nonatomic, readonly) MPMoviePlayerController *moviePlayer;
- (BOOL)shouldAutorotate;
- (NSUInteger)supportedInterfaceOrientations;
@end

@interface UIViewController (MPMoviePlayerViewController)

- (void)presentMoviePlayerViewControllerAnimated:(MPMoviePlayerViewController *)moviePlayerViewController;
- (void)dismissMoviePlayerViewControllerAnimated;

@end
