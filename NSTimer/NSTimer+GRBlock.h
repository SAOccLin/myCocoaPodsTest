//
//  NSTimer+GRBlock.h
//  YC_GRice
//
//  Created by 黄智泉 on 2019/8/26.
//  Copyright © 2019 YeCai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (GRBlock)
+ (NSTimer *)gr_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block;

+ (instancetype)gr_scheduledTimerWithTimeInterval:(NSTimeInterval)interval runLoopMode:(NSRunLoopMode)mode repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block;
@end

NS_ASSUME_NONNULL_END
