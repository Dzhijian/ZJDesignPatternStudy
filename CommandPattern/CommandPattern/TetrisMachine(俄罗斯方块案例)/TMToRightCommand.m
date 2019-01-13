//
//  TMToRightCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "TMToRightCommand.h"

@interface TMToRightCommand ()

@property (nonatomic, strong) TetrisMachine *tm;
@end

@implementation TMToRightCommand

-(instancetype)initWithTetriMachine:(TetrisMachine *)tm{
    if (self = [super init]) {
        self.tm = tm;
    }
    return self;
}



// 执行具体命令
- (void)execute{
    [self.tm toRight];
}
@end
