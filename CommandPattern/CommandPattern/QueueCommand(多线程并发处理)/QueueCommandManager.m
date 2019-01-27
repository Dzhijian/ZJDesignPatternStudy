
//
//  QueueCommandManager.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/28.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "QueueCommandManager.h"
#import "DynamicCommand.h"
#import "CompoundCommand.h"

@interface QueueCommandManager ()

@property(nonatomic, strong) NSMutableArray* commands;
@property(nonatomic, strong) TetrisMachine* tm;
@property (nonatomic, strong) dispatch_queue_t queue;

@end
@implementation QueueCommandManager

- (instancetype)initWithTetrisMachine:(TetrisMachine*)tm{
    self = [super init];
    if (self) {
        self.tm = tm;
        self.commands = [[NSMutableArray alloc] init];
        
        self.queue = dispatch_queue_create("queueCommand", NULL);
    }
    return self;
}

// 向左命令
-(void)toLeftCommand{
    [self addCommand:@"toLeft"];
    [self.tm toLeft];
}
// 向右命令
-(void)toRightCommand{
    [self addCommand:@"toRight"];
    [self.tm toRight];
}
// 变形命令
-(void)toTransformCommand{
    [self addCommand:@"toTransform"];
    [self.tm toTransform];
}

-(void)addCommand:(NSString*)methodName{
    
    // 考虑线程安全
    // 多线程处理 异步
    dispatch_sync(self.queue, ^{
        
        // 根据方法名称,动态加载执行对象的方法
        // 获取方法对象
        SEL method = NSSelectorFromString(methodName);
        // 添加命令
        [self.commands addObject:[DynamicCommand createCommand:self.tm block:^(TetrisMachine * _Nonnull tm) {
            [self.tm performSelector:method];
        }]];
    });
    
}

-(void)undoOpreation{
    if (self.commands.count > 0) {
        NSLog(@"撤销如下：...");
        //撤销->DynamicCommand
        [[self.commands lastObject] execute];
        //移除
        [self.commands removeLastObject];
    }
}

-(void)undoAllOpreation{
    NSLog(@"撤销所有");
    CompoundCommand* command = [[CompoundCommand alloc] initWithCommands:self.commands];
    [command execute];
    [self.commands removeAllObjects];
}
@end
