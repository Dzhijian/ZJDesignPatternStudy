//
//  GenericsCommand.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/21.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "GenericsCommand.h"

@interface GenericsCommand<T> ()
/**
 * 父类引用指向子类实例对象（面向对象编程）->架构设计中以后经常看到->后面讲解的内容都将面向协议
 * 注意: id 指向 泛型类型
 */
@property (nonatomic, strong) id receiver;
@property (nonatomic, copy) void(^commandBlock)(T);

@end

@implementation GenericsCommand

-(instancetype)initWithReceiver:(id)receiver block:(void(^)(id))commandBlock{
    if (self = [super init]) {
        self.receiver = receiver;
        self.commandBlock = commandBlock;
        
    }
    return self;
}

-(void)execute{
    self.commandBlock(self.receiver);
}

+(id<TMCommandProtocol>)createCommand:(id)receiver block:(void(^)(id))commandBlock{
    return [[GenericsCommand alloc]initWithReceiver:receiver block:commandBlock];
}
@end
