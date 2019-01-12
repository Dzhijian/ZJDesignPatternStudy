//
//  Invoker.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConcreteCommand.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 角色四：请求者 -> invoker
 */
@interface Invoker : NSObject

// 所有命令都是由客户端来决定
-(instancetype)initConcreteCommand:(ConcreteCommand *)concreteCommand;
// 方法实现
-(void)concreteCommand;

@end

NS_ASSUME_NONNULL_END
