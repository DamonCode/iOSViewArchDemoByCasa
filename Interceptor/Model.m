//
//  Model.m
//  Interceptor
//
//  Created by YoFun on 15/5/28.
//  Copyright (c) 2015年 alibaba. All rights reserved.
//

#import "Model.h"

@implementation Model

-(instancetype)init
{
    if (!self) {
        self = [super init];
    }
    
    return self;
}

-(void)tryBlock:(whereToGo)block
{
    self.letitBe = block;
    [self exuteBlock];
}

-(void)exuteBlock
{
//    self.letitBe = ^(NSString *str, NSArray *arr){
//        str = @"hello!";
//        arr = @[@"fist one",@"second one"];
//    };
    self.letitBe(@"hello",@[@"first",@"second!!!!"]);
}

@end
