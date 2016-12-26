//
//  ViewController.m
//  Interceptor
//
//  Created by casa on 4/17/15.
//  Copyright (c) 2015 alibaba. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController()

@property(nonatomic) NSString *hasam;
@property(nonatomic) NSArray  *walu;
@property(nonatomic) Model *model;

@end

@implementation ViewController

/*
 
    业务方也不需要写任何迎合框架的代码
 */

-(void)viewDidLoad
{
    _model = [[Model alloc] init];
    
    [_model tryBlock:^(NSString *str, NSArray *arr) {
        _hasam = str;
        self.walu = arr;
        
    }];
    
    NSLog(@"this is the block val pass in:%@,%@",self.hasam,self.walu);
    
    [self.model addObserver:self forKeyPath:@"dogname" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    for (int i = 0; i<10; i++) {
        self.model.dogname = [NSString stringWithFormat:@"this is the %d th time",i];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath  isEqual: @"dogname"]) {
        NSLog(@"now the dog's name is :%@",[object valueForKey:@"dogname"]);
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.model removeObserver:self forKeyPath:@"dogname" context:nil];
}

@end
