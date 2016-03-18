//
//  MPUtility.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 3/18/16.
//  Copyright © 2016 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPUtility.h"

@implementation __MPWeakTimer

- (instancetype)initWithTarget:(id)target selector:(SEL)aSelector
{
    self = [super init];
    if (self) {
        _target = target;
        _selector = aSelector;
    }
    return self;
}

- (void)fire:(NSTimer *)timer
{
    if (_target) {
        [_target performSelector:_selector withObject:timer];
    } else {
        [timer invalidate];
    }
}

- (void)invalidate
{
    [_timer invalidate];
}

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                        target:(id)object
                                      selector:(SEL)selector
                                      userInfo:(id)info
                                       repeats:(BOOL)f
{
    __MPWeakTimer *wt = [[self alloc] initWithTarget:object selector:selector];
    NSTimer*timer = [NSTimer scheduledTimerWithTimeInterval:ti
                                                     target:wt
                                                   selector:@selector(fire:)
                                                   userInfo:info
                                                    repeats:f];
    wt.timer = timer;
    return wt;
}
@end
