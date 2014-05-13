//
//  MPMediaQuery.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItem.h>

@class MPMediaPredicate;

enum {
    MPMediaGroupingTitle,
    MPMediaGroupingAlbum,
    MPMediaGroupingArtist,
    MPMediaGroupingAlbumArtist,
    MPMediaGroupingComposer,
    MPMediaGroupingGenre,
    MPMediaGroupingPlaylist,
    MPMediaGroupingPodcastTitle
};
typedef NSInteger MPMediaGrouping;

@interface MPMediaQuery : NSObject

- (id)init;
- (id)initWithFilterPredicates:(NSSet *)filterPredicates;
@property(nonatomic, strong) NSSet *filterPredicates;

- (void)addFilterPredicate:(MPMediaPredicate *)predicate;
- (void)removeFilterPredicate:(MPMediaPredicate *)predicate;

@property(nonatomic, readonly) NSArray *items;
@property(nonatomic, readonly) NSArray *collections;
@property(nonatomic) MPMediaGrouping groupingType;
@property (nonatomic, readonly) NSArray *itemSections;
@property (nonatomic, readonly) NSArray *collectionSections;

+ (MPMediaQuery *)albumsQuery;
+ (MPMediaQuery *)artistsQuery;
+ (MPMediaQuery *)songsQuery;
+ (MPMediaQuery *)playlistsQuery;
+ (MPMediaQuery *)podcastsQuery;
+ (MPMediaQuery *)audiobooksQuery;
+ (MPMediaQuery *)compilationsQuery;
+ (MPMediaQuery *)composersQuery;
+ (MPMediaQuery *)genresQuery;

@end

@interface MPMediaPredicate : NSObject  //<NSSecureCoding> {}
@end

enum {
    MPMediaPredicateComparisonEqualTo,
    MPMediaPredicateComparisonContains
};
typedef NSInteger MPMediaPredicateComparison;

@interface MPMediaPropertyPredicate : MPMediaPredicate

+ (MPMediaPropertyPredicate *)predicateWithValue:(id)value forProperty:(NSString *)property;
+ (MPMediaPropertyPredicate *)predicateWithValue:(id)value forProperty:(NSString *)property comparisonType:(MPMediaPredicateComparison)comparisonType;

@property(nonatomic, readonly, copy) NSString *property;
@property(nonatomic, readonly, copy) id value;
@property(nonatomic, readonly) MPMediaPredicateComparison comparisonType;

@end

@interface MPMediaItem (MPMediaQueryAdditions)

+ (NSString *)persistentIDPropertyForGroupingType:(MPMediaGrouping)groupingType;
+ (NSString *)titlePropertyForGroupingType:(MPMediaGrouping)groupingType;

@end


