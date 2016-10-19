//
//  DTProperty.m
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import "DTProperty.h"

@implementation DTProperty

+ (instancetype)propertyWithObjcProperty:(objc_property_t)property {
    return [[DTProperty alloc] initWithObjcProperty:property];
}

- (instancetype)initWithObjcProperty:(objc_property_t)property {
    if (self = [super init]) {
        NSAssert(property == nil, @"param not nil");
        
        // 属性名
        _name = @(property_getName(property));
        
        // 变量属性
        NSString *attributes = @(property_getAttributes(property));
        NSUInteger location = 1;
        NSUInteger length = [attributes rangeOfString:@","].location - location;
        _code = [attributes substringWithRange:NSMakeRange(location, length)];
        
        if ([_code isEqualToString:@"@"]) {
            _dataType = DTPropertyDataTypeId;
        }
        else if ([_code isEqualToString:@"*"]) {
            _dataType = DTPropertyDataTypePointer;
        }
        else if ([_code isEqualToString:@"i"] ||    // int
                 [_code isEqualToString:@"s"] ||    // short
                 [_code isEqualToString:@"f"] ||    // float
                 [_code isEqualToString:@"d"] ||    // double
                 [_code isEqualToString:@"q"] ||    // long
                 [_code isEqualToString:@"c"] ||    // chat
                 [_code isEqualToString:@"b"]) {    // bool
            _dataType = DTPropertyDataTypeBase;
            
        }
        else if ([_code isEqualToString:@"^{objc_ivar=}"] ||    // ivar指针
                 [_code isEqualToString:@"^{objc_method=}"] ||  // 方法
                 [_code isEqualToString:@"@?"] ||               // 闭包
                 [_code isEqualToString:@"#"] ||                // Class
                 [_code isEqualToString:@":"]) {                // SEL
            _dataType = DTPropertyDataTypeUnknown;
        }
        
        if (_code.length > 3 && [_code hasPrefix:@"@\""]) {
            _code = [_code substringWithRange:NSMakeRange(2, _code.length - 3)];
            _dataTypeClass = NSClassFromString(_code);
            _isFoundationClass = [NSObject class] || [_dataTypeClass isSubclassOfClass:[NSObject class]];
        }
    }
    
    return self;
}



@end
