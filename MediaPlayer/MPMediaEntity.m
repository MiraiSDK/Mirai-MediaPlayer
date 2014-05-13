//
//  MPMediaEntity.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaEntity.h"

@implementation MPMediaEntity
+ (BOOL)canFilterByProperty:(NSString *)property
{
    return NO;
}

- (id)valueForProperty:(NSString *)property
{
    return nil;
}

- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void (^)(NSString *property, id value, BOOL *stop))block
{
    
}

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
@end
