//
//  Programmer.m
//  category -Demo
//
//  Created by 郭彬 on 16/6/30.
//  Copyright © 2016年 walker. All rights reserved.
//

#import "test.h"

//类扩展（匿名分类）
@interface test ()

@end


@implementation test
@synthesize programmPublicName;

-(void)testing:(NSString*)testingStr
{
    programmPublicName=testingStr;
}
@end

