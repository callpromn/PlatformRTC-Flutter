//
//  NSObject+YRTCInvotion.h
//  QRTCSDK
//
//  Created by mac on 2021/6/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YRTCInvotion)
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end

NS_ASSUME_NONNULL_END
