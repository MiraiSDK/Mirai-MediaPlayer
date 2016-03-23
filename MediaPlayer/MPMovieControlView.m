//
//  MPMovieControlView.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 12/9/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMovieControlView.h"
#import "MPMoviePlayerController+MPPrivate.h"
#import <UIKit/UIKit.h>
#import "MPUtility.h"

#define DefaultPanelBackgroundColor [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5]
#define DefaultPanelHideAutomaticallyTime 5

#define DefaultBottomPanelHeight 80
#define DefaultTopPanelHeight 60
#define DefaultStandardButtonSize 40
#define DefaultEmbeddedButtonToBorderDistance 30
#define DefaultProgressBarWidthProportion 0.65
#define DefaultProgressBarHeight 55
#define DefaultTimeLabelWidth 130
#define DefaultTimeLabelInverval 30

@interface UISlider (MPMovieControlViewPrivateMethod)

@property (nonatomic, readonly) BOOL hasDragThumbLastTouch;
@property (nonatomic, assign) id privateDelegate;

@end

@interface MPMovieControlView ()
@property (nonatomic) MPMovieControlStyle controlStyle;
@property (nonatomic) BOOL maskProgressValueChangedCallback;
@property (nonatomic, strong) UIButton *playOrPauseButton;
@property (nonatomic, strong) UIButton *fullscreenButton;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UILabel *playedTimeText;
@property (nonatomic, strong) UILabel *remainTimeText;
@property (nonatomic, strong) UISlider *progressSliderBar;
@property (nonatomic, strong) UIView *topPanel;
@property (nonatomic, strong) UIView *bottomPanel;
@property (nonatomic) BOOL panelVisible;
@property (nonatomic, strong) __MPWeakTimer *hidePanelTimer;
@end

@implementation MPMovieControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _settingDefaultValues];
        [self _makeAllPanels];
        [self _hidePanel];
        [self _resetPanelToMatchControlStyle:MPMovieControlModeDefault];
    }
    return self;
}

- (void)_makeAllPanels
{
    self.topPanel = [self _createPanel];
    self.bottomPanel = [self _createPanel];
}

- (void)_settingDefaultValues
{
    _maskProgressValueChangedCallback = NO;
}

- (UIView *)_createPanel
{
    UIView *panel = [[UIView alloc] initWithFrame:CGRectZero];
    panel.backgroundColor = DefaultPanelBackgroundColor;
    [self _addTapGestureRecognizerForPanel:panel];
    [self addSubview:panel];
    return panel;
}

- (void)_addTapGestureRecognizerForPanel:(UIView *)panel
{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_expandActivity:)];
    gestureRecognizer.numberOfTapsRequired = 1;
    [panel addGestureRecognizer:gestureRecognizer];
}

#pragma mark - init and resize panel.

- (void)setControlStyle:(MPMovieControlStyle)controlStyle
{
    if (_controlStyle != controlStyle) {
        [self _resetPanelToMatchControlStyle:controlStyle];
    }
}

- (void)_resetPanelToMatchControlStyle:(MPMovieControlStyle)controlStyle
{
    _controlStyle = controlStyle;
    [self _clearPanel];
    [self _initPanelForStyle:controlStyle];
    [self _resizeForStyle:controlStyle];
    [self _refreshButtonStateForStyle:controlStyle];
    [self _refreshPanelVisibleState];
}

- (void)layoutSubviews
{
    [self _resizeForStyle:self.controlStyle];
}

- (void)refreshPlaybackState
{
    [self _refreshButtonStateForStyle:self.controlStyle];
}

- (void)_initPanelForStyle:(MPMovieControlStyle)controlStyle
{
    switch (controlStyle) {
        case MPMovieControlStyleNone:
            //before None hide, it looks like Embedded style.
            [self _initPanelForEmbedded];
            break;
            
        case MPMovieControlStyleEmbedded:
            [self _initPanelForEmbedded];
            break;
            
        case MPMovieControlStyleFullscreen:
            [self _initPanelForFullscreen];
            break;
    }
}

- (void)_resizeForStyle:(MPMovieControlStyle)controlStyle
{
    [self _resizeForTopPanel];
    [self _resizeForBottomPanel];
    
    switch (controlStyle) {
        case MPMovieControlStyleNone:
            [self _resizeForEmbedded];
            break;
            
        case MPMovieControlStyleEmbedded:
            [self _resizeForEmbedded];
            break;
            
        case MPMovieControlStyleFullscreen:
            [self _resizeForFullscreen];
            break;
    }
}

- (void)_refreshButtonStateForStyle:(MPMovieControlStyle)controlStyle
{
    switch (controlStyle) {
        case MPMovieControlStyleNone:
            [self _refreshButtonStateForEmbedded];
            break;
            
        case MPMovieControlStyleEmbedded:
            [self _refreshButtonStateForEmbedded];
            break;
            
        case MPMovieControlStyleFullscreen:
            [self _refreshButtonStateForFullscreen];
            break;
    }
}

- (void)_clearPanel
{
    [self _clearAllSubviewForContainer:self.topPanel];
    [self _clearAllSubviewForContainer:self.bottomPanel];
    [self _setNilForAllProperties];
}

- (void)_clearAllSubviewForContainer:(UIView *)container
{
    while (container.subviews.count > 0) {
        UIView *subview = [container.subviews objectAtIndex:0];
        [subview removeFromSuperview];
    }
}

- (void)_setNilForAllProperties
{
    self.playOrPauseButton = nil;
    self.fullscreenButton = nil;
    self.previousButton = nil;
    self.nextButton = nil;
    self.doneButton = nil;
    self.playedTimeText = nil;
    self.remainTimeText = nil;
    self.progressSliderBar = nil;
}

- (void)_resizeForBottomPanel
{
    self.bottomPanel.frame = CGRectMake(0, [self _countBottomPanelYLocation],
                                        self.bounds.size.width, DefaultBottomPanelHeight);
}

- (CGFloat)_countBottomPanelYLocation
{
    CGFloat mediaViewHeight = self.bounds.size.height;
    CGFloat bottomPanelY = mediaViewHeight - DefaultBottomPanelHeight;
    
    if (bottomPanelY < 0) {
        bottomPanelY = 0;
    }
    if (!self.topPanel.hidden) {
        CGFloat bottomLocationOfTopPanel = self.topPanel.frame.origin.y + self.topPanel.frame.size.height;
        if (bottomPanelY < bottomLocationOfTopPanel) {
            bottomPanelY = bottomLocationOfTopPanel;
        }
    }
    return bottomPanelY;
}

- (void)_resizeForTopPanel
{
    self.topPanel.frame = CGRectMake(0, 0, self.bounds.size.width, DefaultTopPanelHeight);
}

- (void)_initPanelForEmbedded
{
    self.playOrPauseButton = [self _createButtonWithAnction:@selector(_onTapPlayOrPauseButton:)
                                              intoContainer:self.bottomPanel];
    self.fullscreenButton = [self _createButtonWithAnction:@selector(_onTapFullscreenButton:)
                                             intoContainer:self.bottomPanel];
    
    [self.fullscreenButton setTitle:@"口" forState:UIControlStateNormal];
}

- (void)_resizeForEmbedded
{
    CGPoint playerOrPauseButtonLocation = CGPointZero;
    playerOrPauseButtonLocation.x = DefaultEmbeddedButtonToBorderDistance;
    playerOrPauseButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                            withContainerSize:self.bottomPanel.bounds.size.height];
    
    CGPoint fullscreenButtonLocation = CGPointZero;
    fullscreenButtonLocation.x = [self _getRightLocationWithComppoentSize:DefaultStandardButtonSize
                                                        withContainerSize:self.bottomPanel.bounds.size.width
                                                         toBorderDistance:DefaultEmbeddedButtonToBorderDistance];
    fullscreenButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultEmbeddedButtonToBorderDistance
                                                         withContainerSize:self.bottomPanel.bounds.size.height];
    
    [self _setStandardSizeForComponent:self.playOrPauseButton andMoveTo:playerOrPauseButtonLocation];
    [self _setStandardSizeForComponent:self.fullscreenButton andMoveTo:fullscreenButtonLocation];
}

- (void)_refreshButtonStateForEmbedded
{
    switch (self.player.playbackState) {
        case MPMoviePlaybackStatePlaying:
            [self.playOrPauseButton setTitle:@"||" forState:UIControlStateNormal];
            break;
            
        default:
            [self.playOrPauseButton setTitle:@"►" forState:UIControlStateNormal];
            break;
    }
}

- (void)_initPanelForFullscreen
{
    self.doneButton = [self _createButtonWithAnction:@selector(_onTapDoneButton:)
                                       intoContainer:self.topPanel];
//    self.playedTimeText = [self _createLabelIntoContainer:self.topPanel];
//    self.remainTimeText = [self _createLabelIntoContainer:self.topPanel];
    self.progressSliderBar = [self _createSliderIntoContainer:self.topPanel];
    
    self.playOrPauseButton = [self _createButtonWithAnction:@selector(_onTapPlayOrPauseButton:)
                                              intoContainer:self.bottomPanel];
    self.previousButton = [self _createButtonWithAnction:@selector(_onTapPreviousButton:)
                                           intoContainer:self.bottomPanel];
    self.nextButton = [self _createButtonWithAnction:@selector(_onTapNextButton:)
                                       intoContainer:self.bottomPanel];
    
    [self.doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [self.previousButton setTitle:@"|<" forState:UIControlStateNormal];
    [self.nextButton setTitle:@">|" forState:UIControlStateNormal];
}

- (void)_resizeForFullscreen
{
    [self _resizeTopPanelForFullscreen];
    [self _resizeBottomPanelForFullscreen];
}

- (void)_resizeTopPanelForFullscreen
{
    CGPoint doneButtonLocation = CGPointZero;
    doneButtonLocation.x = DefaultEmbeddedButtonToBorderDistance;
    doneButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                   withContainerSize:self.topPanel.bounds.size.height];
    
    CGFloat progressWidth = DefaultProgressBarWidthProportion*self.topPanel.bounds.size.width;
    CGPoint progressLocation = CGPointZero;
    progressLocation.x = [self _getCenterLocationWithComponentSize:progressWidth
                                                 withContainerSize:self.topPanel.bounds.size.width];
    progressLocation.y = [self _getCenterLocationWithComponentSize:DefaultProgressBarHeight
                                                 withContainerSize:self.topPanel.bounds.size.height];
    
    CGSize timeLabelSize = CGSizeMake(DefaultTimeLabelWidth, DefaultStandardButtonSize);
    
    CGPoint leftTimeLabelLocation = CGPointZero;
    leftTimeLabelLocation.x = progressLocation.x - DefaultTimeLabelInverval - DefaultTimeLabelWidth;
    leftTimeLabelLocation.y = [self _getCenterLocationWithComponentSize:DefaultTimeLabelWidth
                                                      withContainerSize:self.topPanel.bounds.size.height];
    
    CGPoint rightTimeLabelLocation = CGPointZero;
    rightTimeLabelLocation.x = progressLocation.x + progressWidth + DefaultTimeLabelInverval;
    rightTimeLabelLocation.y = [self _getCenterLocationWithComponentSize:DefaultTimeLabelInverval
                                                       withContainerSize:self.topPanel.bounds.size.height];
    
    [self _setStandardSizeForComponent:self.doneButton andMoveTo:doneButtonLocation];
    [self _setSpecialSize:CGSizeMake(progressWidth, DefaultProgressBarHeight)
             forComponent:self.progressSliderBar andMovieTo:progressLocation];
//    [self _setSpecialSize:timeLabelSize forComponent:self.playedTimeText andMovieTo:leftTimeLabelLocation];
//    [self _setSpecialSize:timeLabelSize forComponent:self.remainTimeText andMovieTo:rightTimeLabelLocation];
}

- (void)_resizeBottomPanelForFullscreen
{
    CGPoint playerOrPauseButtonLocation = CGPointZero;
    playerOrPauseButtonLocation.x = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                            withContainerSize:self.bottomPanel.bounds.size.width];
    playerOrPauseButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                            withContainerSize:self.bottomPanel.bounds.size.height];
    
    CGFloat remainDistanceOfBottom = playerOrPauseButtonLocation.x;
    CGPoint prevousButtonLocation = CGPointZero;
    prevousButtonLocation.x = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                      withContainerSize:remainDistanceOfBottom];
    prevousButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                      withContainerSize:self.bottomPanel.bounds.size.height];
    
    CGFloat startLocationOfRightArea = playerOrPauseButtonLocation.x + DefaultStandardButtonSize;
    CGPoint nextButtonLocation = CGPointZero;
    nextButtonLocation.x = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                   withContainerSize:remainDistanceOfBottom] + startLocationOfRightArea;
    nextButtonLocation.y = [self _getCenterLocationWithComponentSize:DefaultStandardButtonSize
                                                   withContainerSize:self.bottomPanel.bounds.size.height];
    
    [self _setStandardSizeForComponent:self.playOrPauseButton andMoveTo:playerOrPauseButtonLocation];
    [self _setStandardSizeForComponent:self.previousButton andMoveTo:prevousButtonLocation];
    [self _setStandardSizeForComponent:self.nextButton andMoveTo:nextButtonLocation];
}

- (void)_refreshButtonStateForFullscreen
{
    switch (self.player.playbackState) {
        case MPMoviePlaybackStatePlaying:
            [self.playOrPauseButton setTitle:@"||" forState:UIControlStateNormal];
            break;
            
        default:
            [self.playOrPauseButton setTitle:@"►" forState:UIControlStateNormal];
            break;
    }
}

#pragma mark - progress

- (void)updateProgress
{
    if (!self.progressSliderBar.hidden && !self.progressSliderBar.hasDragThumbLastTouch) {
        _maskProgressValueChangedCallback = YES;
        [self.progressSliderBar setValue:self.player.currentPlaybackRate];
        _maskProgressValueChangedCallback = NO;
    }
}

- (void)_makeTouchNotifierForProgressBar:(UISlider *)progressBar
{
    [progressBar addTarget:self action:@selector(_onProgressValueChanged:)
          forControlEvents:UIControlEventValueChanged];
    [progressBar setPrivateDelegate:self];
}

- (void)_onProgressValueChanged:(id)sender
{
    if (!_maskProgressValueChangedCallback) {
        [self.player setCurrentPlaybackRate:self.progressSliderBar.value];
    }
}

- (void)onStartDragging
{
}

- (void)onEndDragging
{
    _maskProgressValueChangedCallback = YES;
    [self.progressSliderBar setValue:self.player.currentPlaybackRate];
    _maskProgressValueChangedCallback = NO;
}

#pragma mark - events callback.

-(void)_expandActivity:(UITapGestureRecognizer *)recognizer
{
    if ([self _tapedAtPanel:self.topPanel withRecognizer:recognizer] ||
        [self _tapedAtPanel:self.bottomPanel withRecognizer:recognizer]) {
        [self _restartHideCountDownTimer];
    }
}

- (void)_onTapPlayOrPauseButton:(id)sender
{
    [self _restartHideCountDownTimer];
    
    switch (self.player.playbackState) {
        case MPMoviePlaybackStatePlaying:
            [self.player pause];
            break;
            
        default:
            [self.player play];
            break;
    }
}

- (void)_onTapFullscreenButton:(id)sender
{
    [self _restartHideCountDownTimer];
    [self.player setFullscreen:!self.player.isFullscreen];
}

- (void)_onTapPreviousButton:(id)sender
{
    [self _restartHideCountDownTimer];
    
}

- (void)_onTapNextButton:(id)sender
{
    [self _restartHideCountDownTimer];
    
}

- (void)_onTapDoneButton:(id)sender
{
    [self _restartHideCountDownTimer];
    
}

- (BOOL)_tapedAtPanel:(UIView *)panel withRecognizer:(UITapGestureRecognizer *)recognizer
{
    if (panel.hidden) {
        return NO;
    }
    CGPoint point = [recognizer locationInView:self];
    return CGRectContainsPoint(panel.frame, point);
}

#pragma mark - show and hide panel

- (void)onTouchScreen
{
    if (self.panelVisible) {
        [self _hidePanel];
    } else {
        if (self.player.controlStyle != MPMovieControlStyleNone) {
            [self _showPanel];
        }
    }
}

- (void)_hidePanel
{
    [self _hideAllPanel];
    self.panelVisible = NO;
}

- (void)_showPanel
{
    [self _showPanelWhichNeed];
    [self _restartHideCountDownTimer];
    self.panelVisible = YES;
}

- (void)_refreshPanelVisibleState
{
    [self _showPanelWhichNeed];
}

- (void)_hideAllPanel
{
    self.topPanel.hidden = YES;
    self.bottomPanel.hidden = YES;
}

- (void)_showPanelWhichNeed
{
    switch (self.player.controlStyle) {
        case MPMovieControlStyleFullscreen:
            self.topPanel.hidden = NO;
            self.bottomPanel.hidden = NO;
            break;
            
        default:
            self.topPanel.hidden = YES;
            self.bottomPanel.hidden = NO;
            break;
    }
}

- (void)_restartHideCountDownTimer
{
    [self _stopHideCountDownTimer];
    self.hidePanelTimer = [__MPWeakTimer scheduledTimerWithTimeInterval:DefaultPanelHideAutomaticallyTime
                                                           target:self selector:@selector(_onTimeOut:)
                                                         userInfo:nil repeats:NO];
}

- (void)_stopHideCountDownTimer
{
    if (self.hidePanelTimer) {
        [self.hidePanelTimer invalidate];
        self.hidePanelTimer = nil;
    }
}

- (void)_onTimeOut:(NSTimer *)timer
{
    if (self.panelVisible) {
        [self _hidePanel];
    }
    self.hidePanelTimer = nil;
}

#pragma mark - hit tests.

- (BOOL)panelAreaInclude:(CGPoint)point
{
    if (!self.topPanel.hidden) {
        return [self _panel:self.topPanel hitTestWithPoint:point];
    }
    if (!self.bottomPanel.hidden) {
        return [self _panel:self.bottomPanel hitTestWithPoint:point];
    }
    return NO;
}

- (BOOL)_panel:(UIView *)panel hitTestWithPoint:(CGPoint)point
{
    return CGRectContainsPoint(panel.frame, point);
}

#pragma mark - uitil functions.

- (UIButton *)_createButtonWithAnction:(SEL)tapedAction intoContainer:(UIView *)container
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:tapedAction forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:button];
    return button;
}

- (UILabel *)_createLabelIntoContainer:(UIView *)container
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setText:@"-"];
    [container addSubview:container];
    return label;
}

- (UISlider *)_createSliderIntoContainer:(UIView *)container
{
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
    slider.continuous = NO;
    slider.maximumTrackTintColor = [UIColor blackColor];
    slider.minimumTrackTintColor = [UIColor whiteColor];
    slider.thumbTintColor = [UIColor whiteColor];
    [slider setThumbImage:[MPMovieControlView _progressSliderThumb] forState:UIControlStateNormal];
    [container addSubview: slider];
    [self _makeTouchNotifierForProgressBar:slider];
    return slider;
}

- (void)_setStandardSizeForComponent:(UIView *)component andMoveTo:(CGPoint)location
{
    component.frame = CGRectMake(location.x, location.y, DefaultStandardButtonSize, DefaultStandardButtonSize);
}

- (void)_setSpecialSize:(CGSize)size forComponent:(UIView *)component andMovieTo:(CGPoint)location
{
    component.frame = CGRectMake(location.x, location.y, size.width, size.height);
}

- (CGFloat)_getCenterLocationWithComponentSize:(CGFloat)componentSize withContainerSize:(CGFloat)containerSize
{
    return (containerSize - componentSize)/2;
}

- (CGFloat)_getRightLocationWithComppoentSize:(CGFloat)componentSize withContainerSize:(CGFloat)containerSize toBorderDistance:(CGFloat)toBorderDistance
{
    return containerSize - componentSize - toBorderDistance;
}

+ (UIImage *)_progressSliderThumb
{
    static UIImage *_defaultThumbImage;
    
    if (!_defaultThumbImage) {
        UIColor *color = [UIColor whiteColor];
        CGSize thumbSize = CGSizeMake(15, 15);
        UIGraphicsBeginImageContextWithOptions(thumbSize, NO, 0.0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextSetLineWidth(context, 0);
        CGRect rect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
        CGContextAddEllipseInRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        CGContextRestoreGState(context);
        _defaultThumbImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return _defaultThumbImage;
}

@end
