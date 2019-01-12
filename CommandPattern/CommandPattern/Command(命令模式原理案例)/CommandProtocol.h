//
//  CommandProtocol.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/12.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#ifndef CommandProtocol_h
#define CommandProtocol_h
/**
 * 命令接口 -> CommandProtocol(协议)
 */
@protocol CommandProtocol<NSObject>


/**
 * 具体 命令
 */
-(void)execute;

@end
#endif /* CommandProtocol_h */
