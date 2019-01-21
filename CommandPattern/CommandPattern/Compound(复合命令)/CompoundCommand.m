//
//  CompoundCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/22.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "CompoundCommand.h"
@interface CompoundCommand ()
@property(nonatomic, strong) NSMutableArray* commands;
@end
@implementation CompoundCommand

-(instancetype)initWithCommands:(NSMutableArray *)commands{
    if (self = [super init]) {
        self.commands = commands;
    }
    return self;
}

//在复合命令中，调用执行多个命令，就叫做复合命令
//复合：多个
-(void)execute{
    // 执行命令
    for (id<TMCommandProtocol> command in self.commands) {
        [command execute];
    }
}
@end
