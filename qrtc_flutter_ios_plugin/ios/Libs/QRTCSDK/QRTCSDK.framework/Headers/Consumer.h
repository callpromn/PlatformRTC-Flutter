//
//  Consumer.h
//  mediasoup-client-ios
//
//  Created by Ethan.
//  Copyright © 2019 Ethan. All rights reserved.
//

#import "RTCMediaStreamTrack.h"


#ifndef Consumer_h
#define Consumer_h
@class RTCPeerConnectionFactory;
@interface Consumer : NSObject
/*! @brief libmediasoupclient native consumer object */
@property(nonatomic, strong) NSValue* _nativeConsumer;
/*! @brief native consumer track object */
@property(nonatomic, strong) RTCMediaStreamTrack *_nativeTrack;

@property(nonatomic, copy) NSString* _recvTransportId; //对应的接收transportId
/* temperary store the last value for bitrate and framerate caculation*/
@property(nonatomic, assign) NSInteger _bytesLastReceived;
@property(nonatomic, assign) NSInteger _framesLastReceived;

-(instancetype)initWithNativeConsumer:(NSValue *)nativeConsumer factory:(RTCPeerConnectionFactory*)factory;
/*! @return Consumer identifier */
-(NSString *)getId;
/*! @return The associated producer identifier */
-(NSString *)getProducerId;
/*! @return Whether the consumer is closed */
-(bool)isClosed;
/*! @return Whether the consumer is paused */
-(bool)isPaused;
/*! @return The media kind (video or audio) */
-(NSString *)getKind;
/*! @return the remote audio or video track */
-(RTCMediaStreamTrack *)getTrack;
/*! @return Consumer RTP parameters */
-(NSString *)getRtpParameters;
/*! @return Custom data object provided by the application in the consumer factory method */
-(NSString *)getAppData;
/*!
    @brief Resumes the consumer
 */
-(void)resume;
/*!
    @brief Pauses the consumer
 */
-(void)pause;
/*! @return Gets the local RTP receiver statistics by calling getStats() in the underlying RTCRtpReceiver instance */
-(NSString *)getStats;
/*!
    @brief Closes the consumer
 */
-(void)close;


-(void)dispose;

@end

@protocol ConsumerListener <NSObject>

/*!
    @brief Executed when the transport this consumer belongs to is closed for whatever reason. The consumer itself is also closed
    @param consumer The consumer instance executing this method
 */
-(void)onTransportClose:(Consumer *)consumer;

@end

#endif /* Consumer_h */
