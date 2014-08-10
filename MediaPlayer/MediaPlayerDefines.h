//
//  MediaPlayerDefines.h
//  MediaPlayer
//
//  Created by Chen Yonghui on 5/13/14.
//  Copyright (c) 2014 Shanghai TinyNetwork Inc. All rights reserved.
//

#ifndef MediaPlayer_MediaPlayerDefines_h
#define MediaPlayer_MediaPlayerDefines_h

#ifdef __cplusplus
#define MP_EXTERN extern "C" __attribute__((visibility ("default")))
#else
#define MP_EXTERN     extern __attribute__((visibility ("default")))
#endif

#define MP_EXTERN_CLASS                    __attribute__((visibility("default")))
#define MP_EXTERN_CLASS_AVAILABLE(version) __attribute__((visibility("default"))) NS_CLASS_AVAILABLE(NA, version)


#endif
