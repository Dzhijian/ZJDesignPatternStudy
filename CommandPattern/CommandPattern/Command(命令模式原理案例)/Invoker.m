//
//  Invoker.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()
/**
 * 父类引用指向子类实例对象(面向对象编程)
 */
@property (nonatomic, strong) id<CommandProtocol>  concreteCom;
@end

/**
 * 请求者/执行者
 * 请求者特点: 执行命令
 * 持有命令对象引用(指针)
 */
@implementation Invoker

-(instancetype)initConcreteCommand:(ConcreteCommand *)concreteCommand{
    if (self = [super init]) {
        self.concreteCom = concreteCommand;
    }
    return self;
}

-(void)concreteCommand{
    // 调用命令
    [self.concreteCom execute] ;
}
@end
