//
//  MPMediaView.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 7/25/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <jni.h>

@interface MPMediaView : UIView

- (id)initWithFrame:(CGRect)frame aMediaPlayer:(jobject)mediaplayer;
@end
