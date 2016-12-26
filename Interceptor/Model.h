//
//  Model.h
//  Interceptor
//
//  Created by YoFun on 15/5/28.
//  Copyright (c) 2015年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Deprecated(explain) __attribute__((deprecated(explain)))

typedef void(^whereToGo)(NSString *str,NSArray *arr);

@interface Model : NSObject
{
    NSString *dogname;
}

@property(nonatomic, strong) NSString *dogname;

@property(nonatomic,strong) whereToGo letitBe;

-(void)tryBlock:(whereToGo)block Deprecated("测试方法");

@end
