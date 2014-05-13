//
//  MPVolumeView.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPVolumeView.h"

@implementation MPVolumeView
- (CGSize)sizeThatFits:(CGSize)size
{
    return size;
}

- (void)setMinimumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
    
}

- (void)setMaximumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
    
}

- (void)setVolumeThumbImage:(UIImage *)image forState:(UIControlState)state
{
    
}

- (UIImage *)minimumVolumeSliderImageForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)maximumVolumeSliderImageForState:(UIControlState)state
{
    return nil;
}

- (UIImage *)volumeThumbImageForState:(UIControlState)state
{
    return nil;
}

- (CGRect)volumeSliderRectForBounds:(CGRect)bounds
{
    return CGRectZero;
}

- (CGRect)volumeThumbRectForBounds:(CGRect)bounds volumeSliderRect:(CGRect)rect value:(float)value
{
    return CGRectZero;
}

- (void)setRouteButtonImage:(UIImage *)image forState:(UIControlState)state
{
    
}

- (UIImage *)routeButtonImageForState:(UIControlState)state
{
    return nil;
}

- (CGRect)routeButtonRectForBounds:(CGRect)bounds
{
    return bounds;
}


@end

NSString *const MPVolumeViewWirelessRoutesAvailableDidChangeNotification = @"MPVolumeViewWirelessRoutesAvailableDidChangeNotification";
NSString *const MPVolumeViewWirelessRouteActiveDidChangeNotification = @"MPVolumeViewWirelessRouteActiveDidChangeNotification";

