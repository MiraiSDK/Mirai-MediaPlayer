//
//  MPMediaPickerController.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaPickerController.h"

@interface MPMediaPickerController ()

@end

@implementation MPMediaPickerController

- (instancetype)init
{
    return [self initWithMediaTypes:MPMediaTypeAny];
}

- (instancetype)initWithMediaTypes:(MPMediaType)mediaTypes
{
    self = [super init];
    return self;
}
@end
