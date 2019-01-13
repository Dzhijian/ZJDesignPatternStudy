//
//  TMToTransformCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "TMToTransformCommand.h"

@interface TMToTransformCommand ()
@property (nonatomic, strong) TetrisMachine *tm;
@end

@implementation TMToTransformCommand

-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm{
    if (self = [super init]) {
        self.tm = tm;
    }
    return self;
}
// 执行具体命令
- (void)execute{
    [self.tm toTransform];
}

@end
