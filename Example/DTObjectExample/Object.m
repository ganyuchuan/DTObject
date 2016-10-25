//
//  Object.m
//  DTObjectExample
//
//  Created by huxiu on 2016/10/25.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import "Object.h"

@implementation Object

@end

@implementation StartImage

@end

@implementation AppVersion

@end

@implementation NewsLatest

@end

@implementation News

- (instancetype)initWithKeyValues:(NSDictionary *)keyValues {
    [News setReplacedPropertyNames:@{@"identifier":@"id"}];
    return [super initWithKeyValues:keyValues];
}

@end
