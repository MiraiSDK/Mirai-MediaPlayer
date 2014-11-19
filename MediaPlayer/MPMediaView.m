//
//  MPMediaView.m
//  MediaPlayer
//
//  Created by Chen Yonghui on 7/25/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#import "MPMediaView.h"
#import <QuartzCore/QuartzCore.h>

#import <TNJavaHelper/TNJavaHelper.h>

#import <GLES2/gl2.h>

typedef BOOL(^EAGLTextureUpdateCallback)(CATransform3D *t);

@interface CAMovieLayer : CALayer

@property (nonatomic, copy) EAGLTextureUpdateCallback updateCallback;
- (BOOL)updateTextureIfNeeds:(CATransform3D *)t;
- (int)textureID;

@end

@implementation MPMediaView {
    jobject _movieRender;
    jclass _movieRenderClass;
}

+ (Class)layerClass
{
    return [CAMovieLayer class];
}

- (void)dealloc
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    (*env)->DeleteGlobalRef(env,_movieRender);
    (*env)->DeleteGlobalRef(env,_movieRenderClass);

}

- (id)initWithFrame:(CGRect)frame aMediaPlayer:(jobject)mediaplayer
{
    self = [super initWithFrame:frame];
    if (self) {
        CAMovieLayer *layer = (CAMovieLayer *)self.layer;
        __weak typeof(self) weakSelf = self;
        layer.updateCallback = ^(CATransform3D *t) {
            BOOL result = [weakSelf updaeTextureIfNeeds:t];
            return result;
        };
        [layer displayIfNeeded];
        
        GLuint tex = [layer textureID];
        
        [self createJavaMovieRenderWithPlayer:mediaplayer textureID:tex];
    }
    return self;
}

// Assume call from rendering thread
- (BOOL)updaeTextureIfNeeds:(CATransform3D *)transform
{
    static JNIEnv *env = NULL;
    if (env == NULL) {
        env = [[TNJavaHelper sharedHelper] env];
    }
    
    jmethodID mid = (*env)->GetMethodID(env,_movieRenderClass,"updateTextureIfNeeds","([F)I");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"updateTextureIfNeeds ([F)I");
        return NO;
    }
    
    jfloatArray trans = (*env)->NewFloatArray(env,16);
    //    NSLog(@"will call java updateTextureIfNeeds()");
    jint result = (*env)->CallIntMethod(env, _movieRender, mid,trans);
    //    NSLog(@"done call java updateTextureIfNeeds()");
    
    jfloat *arr = (*env)->GetFloatArrayElements(env,trans,NULL);
    CATransform3D t = CATransform3DIdentity;
    if (arr != NULL) {
        CATransform3D matrix = {
            arr[0],arr[1],arr[2],arr[3],
            arr[4],arr[5],arr[6],arr[7],
            arr[8],arr[9],arr[10],arr[11],
            arr[12],arr[13],arr[14],arr[15]};
        t = matrix;
    }
    (*env)->ReleaseFloatArrayElements(env,trans,arr,0);
    (*env)->DeleteLocalRef(env,trans);
    
    *transform = t;
    return result;
}


- (void)createJavaMovieRenderWithPlayer:(jobject)player textureID:(int)texID;
{
    JNIEnv *env = [[TNJavaHelper sharedHelper] env];
    
    jclass class = [[TNJavaHelper sharedHelper] findCustomClass:@"org.tiny4.CocoaActivity.MovieRender"];
    
    if (class == NULL) {
        NSLog(@"class not found: %@",@"org/tiny4/CocoaActivity/MovieRender");
        
        jclass class = (*env)->FindClass(env,"org/tiny4/CocoaActivity/CocoaActivity");
        if (class == NULL) {
            NSLog(@"class not found: %@",@"org/tiny4/CocoaActivity/CocoaActivity");
        }
        return;
    }
    
    jmethodID mid = (*env)->GetMethodID(env,class,"<init>","(Landroid/media/MediaPlayer;I)V");
    if (mid == NULL) {
        NSLog(@"method id not found:%@",@"init  ([Landroid/media/MediaPlayer;I)V");
        return;
    }
    
    jobject object = (*env)->NewObject(env,class,mid,player,texID);
    
    if (object == NULL) {
        NSLog(@"create object failed");
        return;
    }
    
    NSLog(@"success create _movieRender:%p",object);
    
    _movieRender = (*env)->NewGlobalRef(env,object);
    _movieRenderClass = (*env)->NewGlobalRef(env,class);
    
    (*env)->DeleteLocalRef(env, class);
    (*env)->DeleteLocalRef(env,object);
}

- (jobject)movieRender
{
    return _movieRender;
}

@end
