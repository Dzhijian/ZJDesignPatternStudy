//
//  TMToLeftCommand.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"
#import "TetrisMachine.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 角色二：具体命令-> 向左命令 TMToLeftCommand
 */

@interface TMToLeftCommand : NSObject<TMCommandProtocol>

-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm;

@end

NS_ASSUME_NONNULL_END
