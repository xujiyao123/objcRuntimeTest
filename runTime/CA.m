//
//  CA.m
//  runTime
//
//  Created by 徐继垚 on 15/8/18.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "CA.h"
#import <objc/runtime.h>

@implementation CA
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(lowercaseString))
    {
        return @"hello world";
    }
    return nil;
}
void dynamicMethodIMP(id self, SEL _cmd)
{
    printf("SEL %s did not exist\n",sel_getName(_cmd));
}

+ (BOOL) resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(f))
    {
        class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}
@end
