//
//  TetrisMachine.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 角色三:接收者
 */
@interface TetrisMachine : NSObject

// 向左
-(void)toLeft;
// 向右
-(void)toRight;
// 变形
-(void)toTransform;

@end

NS_ASSUME_NONNULL_END
