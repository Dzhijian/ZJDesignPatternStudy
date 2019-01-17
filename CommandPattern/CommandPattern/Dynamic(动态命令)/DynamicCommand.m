//
//  DynamicCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/17.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "DynamicCommand.h"

@interface DynamicCommand ()

@property (nonatomic, strong) TetrisMachine *tm;

@property (nonatomic, copy) DynamicBlock tmblock;

@end

// 解决方案:block 实现
@implementation DynamicCommand


-(instancetype)initTetrisMachine:(TetrisMachine *)tm block:(DynamicBlock)tmBlock{
    if (self = [super init]) {
        self.tm = tm;
        self.tmblock = tmBlock;
    }
    return self;
}

-(void)execute{
    
    self.tmblock(self.tm);
}

// 创建对象的时候由于有的时候初始化参数过于复杂,这个我们可以内部提供 
// 动态命令的创建,专门有了实现,外部只需要调用即可
// 类方法
+(id<TMCommandProtocol>)createCommand:(TetrisMachine *)tm block:(DynamicBlock)tmBlock{
    return [[DynamicCommand alloc]initTetrisMachine:tm block:tmBlock];
}
@end
