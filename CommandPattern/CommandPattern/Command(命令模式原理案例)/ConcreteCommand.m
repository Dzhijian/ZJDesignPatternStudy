//
//  ConcreteCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "ConcreteCommand.h"

@interface ConcreteCommand ()
@property (nonatomic, strong) Receiver *receiver;
@end

@implementation ConcreteCommand

-(instancetype)initWithRecevicer:(Receiver *)recevier {
    
    if (self = [super init]) {
        
        self.receiver = recevier;
    }
    return self;
}

-(void)execute{
    NSLog(@"具体的代码逻辑实现");
    [self.receiver run];
}

@end
