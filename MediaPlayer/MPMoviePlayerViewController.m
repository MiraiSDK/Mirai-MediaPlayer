//
//  MPMoviePlayerViewController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMoviePlayerViewController.h"

@interface MPMoviePlayerViewController ()

@end

@implementation MPMoviePlayerViewController
- (id)initWithContentURL:(NSURL *)contentURL
{
    self = [super init];
    if (self) {
    }
    return self;
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
