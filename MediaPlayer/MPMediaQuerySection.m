//
//  MPMediaQuerySection.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaQuerySection.h"

@implementation MPMediaQuerySection
#pragma mark - NSSecureCoding
+ (BOOL)supportsSecureCoding
{
    return NO;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    MPMediaQuerySection *copy = [[[self class] alloc] init];
    return copy;
}
@end
