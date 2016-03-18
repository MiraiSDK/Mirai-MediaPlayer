//
//  MPUtility.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 3/18/16.
//  Copyright © 2016 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface __MPWeakTimer : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;
- (instancetype)initWithTarget:(id)target selector:(SEL)aSelector;

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                        target:(id)object
                                      selector:(SEL)selector
                                      userInfo:(id)info
                                       repeats:(BOOL)f;

- (void)fire:(NSTimer *)timer;

- (void)invalidate;
@end
