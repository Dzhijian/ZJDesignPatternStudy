//
//  ConcreteCommand.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"
#import "Receiver.h"

NS_ASSUME_NONNULL_BEGIN


/**
 * 角色三：具体命令 -> ConcreteCommand
 * 特点: 持有接受者的引用, 实现具体命令
 */
@interface ConcreteCommand : NSObject<CommandProtocol>

-(instancetype)initWithRecevicer:(Receiver *)recevier;

@end

NS_ASSUME_NONNULL_END
