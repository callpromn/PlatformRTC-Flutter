//
//  FrameBuffer.h
//  Meet_iOS
//
//  Created by xuechaoge on 2021/10/19.
//

#ifndef FrameBuffer_h
#define FrameBuffer_h

#include <stdio.h>
#include <stdint.h>

int   mirror_video_frame(const uint8_t* buffer,int stride,int height);

#endif /* FrameBuffer_h */
