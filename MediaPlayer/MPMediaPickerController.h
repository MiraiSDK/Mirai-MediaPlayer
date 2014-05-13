//
//  MPMediaPickerController.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItem.h>
#import <MediaPlayer/MPMediaItemCollection.h>

@protocol MPMediaPickerControllerDelegate;

@interface MPMediaPickerController : UIViewController
- (instancetype)init;
- (instancetype)initWithMediaTypes:(MPMediaType)mediaTypes;
@property (nonatomic, readonly) MPMediaType mediaTypes;
@property (nonatomic, weak) id<MPMediaPickerControllerDelegate> delegate;
@property (nonatomic) BOOL allowsPickingMultipleItems;
@property (nonatomic) BOOL showsCloudItems;
@property (nonatomic, copy) NSString *prompt;
@end

@protocol MPMediaPickerControllerDelegate<NSObject>
@optional
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection;
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker;

@end
