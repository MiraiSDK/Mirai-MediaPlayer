//
//  MPMediaItemCollection.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaItemCollection.h"

@implementation MPMediaItemCollection
+ (MPMediaItemCollection *)collectionWithItems:(NSArray *)items
{
    return [[self alloc] initWithItems:items];
}

- (id)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        _items = items;
    }
    return self;
}

@end
