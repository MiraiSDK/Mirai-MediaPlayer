//
//  MPMediaQuery.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaQuery.h"

@implementation MPMediaQuery

- (id)init
{
    return [self initWithFilterPredicates:nil];
}

- (id)initWithFilterPredicates:(NSSet *)filterPredicates
{
    return self;
}

- (void)addFilterPredicate:(MPMediaPredicate *)predicate
{
    
}

- (void)removeFilterPredicate:(MPMediaPredicate *)predicate
{
    
}

+ (MPMediaQuery *)albumsQuery
{
    return nil;
}

+ (MPMediaQuery *)artistsQuery
{
    return nil;
}

+ (MPMediaQuery *)songsQuery
{
    return nil;
}

+ (MPMediaQuery *)playlistsQuery
{
    return nil;
}

+ (MPMediaQuery *)podcastsQuery
{
    return nil;
}

+ (MPMediaQuery *)audiobooksQuery
{
    return nil;
}

+ (MPMediaQuery *)compilationsQuery
{
    return nil;
}

+ (MPMediaQuery *)composersQuery
{
    return nil;
}

+ (MPMediaQuery *)genresQuery
{
    return nil;
}

@end

@implementation MPMediaPredicate

+ (MPMediaPropertyPredicate *)predicateWithValue:(id)value forProperty:(NSString *)property
{
    return nil;
}

+ (MPMediaPropertyPredicate *)predicateWithValue:(id)value forProperty:(NSString *)property comparisonType:(MPMediaPredicateComparison)comparisonType
{
    return nil;
}

@end

@implementation MPMediaItem (MPMediaQueryAdditions)

+ (NSString *)persistentIDPropertyForGroupingType:(MPMediaGrouping)groupingTyp
{
    return nil;
}

+ (NSString *)titlePropertyForGroupingType:(MPMediaGrouping)groupingType
{
    return nil;
}


@end