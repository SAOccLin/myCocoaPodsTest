//
//  NSTimer+GRBlock.m
//  YC_GRice
//
//  Created by 黄智泉 on 2019/8/26.
//  Copyright © 2019 YeCai. All rights reserved.
//

#import "NSTimer+GRBlock.h"

@implementation NSTimer (GRBlock)
+ (NSTimer *)gr_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block
{
    if (@available(iOS 10.0, *)) {
        return [self scheduledTimerWithTimeInterval:interval
                                            repeats:repeats
                                              block:block];
    } else {
        return [self scheduledTimerWithTimeInterval:interval
                                             target:self
                                           selector:@selector(gs_timerTick:)
                                           userInfo:[block copy]
                                            repeats:repeats];
    }
}

+ (instancetype)gr_scheduledTimerWithTimeInterval:(NSTimeInterval)interval runLoopMode:(NSRunLoopMode)mode repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block
{
    if (@available(iOS 10.0, *)) {
        NSTimer *timer = [self scheduledTimerWithTimeInterval:interval
                                                      repeats:repeats
                                                        block:block];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:mode];
        return timer;
    } else {
        NSTimer *timer = [self scheduledTimerWithTimeInterval:interval
                                                       target:self
                                                     selector:@selector(gs_timerTick:)
                                                     userInfo:[block copy]
                                                      repeats:repeats];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:mode];
        return timer;
    }
}


+ (void)gs_timerTick:(NSTimer *)timer {
    void (^block)(NSTimer *) = timer.userInfo;
    !block ?: block(timer);
}

@end
