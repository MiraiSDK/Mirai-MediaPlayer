//
//  MPMoviePlayerViewController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMoviePlayerViewController.h"
#import "MPMoviePlayerController.h"

@interface MPMoviePlayerViewController ()

@end

@implementation MPMoviePlayerViewController
- (id)initWithContentURL:(NSURL *)contentURL
{
    self = [super init];
    if (self) {
        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:contentURL];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[_moviePlayer view]];
    
}
- (BOOL)shouldAutorotate
{
    return [super shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [super supportedInterfaceOrientations];
}

- (void)viewDidLayoutSubviews
{
    _moviePlayer.view.frame = self.view.bounds;
}

@end

@implementation UIViewController (MPMoviePlayerViewController)

- (void)presentMoviePlayerViewControllerAnimated:(MPMoviePlayerViewController *)moviePlayerViewController
{
    
}

- (void)dismissMoviePlayerViewControllerAnimated
{
    
}

@end
