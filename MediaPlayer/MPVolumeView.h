//
//  MPVolumeView.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@interface MPVolumeView : UIView <NSCoding>
- (CGSize)sizeThatFits:(CGSize)size;

@property (nonatomic) BOOL showsVolumeSlider;
@property (nonatomic) BOOL showsRouteButton;

@property (nonatomic, readonly, getter=areWirelessRoutesAvailable) BOOL wirelessRoutesAvailable;
@property (nonatomic, readonly, getter=isWirelessRouteActive) BOOL wirelessRouteActive;

- (void)setMinimumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMaximumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state;
- (void)setVolumeThumbImage:(UIImage *)image forState:(UIControlState)state;

- (UIImage *)minimumVolumeSliderImageForState:(UIControlState)state;
- (UIImage *)maximumVolumeSliderImageForState:(UIControlState)state ;
- (UIImage *)volumeThumbImageForState:(UIControlState)state;

@property (nonatomic, strong) UIImage *volumeWarningSliderImage;

- (CGRect)volumeSliderRectForBounds:(CGRect)bounds;
- (CGRect)volumeThumbRectForBounds:(CGRect)bounds volumeSliderRect:(CGRect)rect value:(float)value;

- (void)setRouteButtonImage:(UIImage *)image forState:(UIControlState)state;
- (UIImage *)routeButtonImageForState:(UIControlState)state;

- (CGRect)routeButtonRectForBounds:(CGRect)bounds;

@end

MP_EXTERN NSString *const MPVolumeViewWirelessRoutesAvailableDidChangeNotification;
MP_EXTERN NSString *const MPVolumeViewWirelessRouteActiveDidChangeNotification;
