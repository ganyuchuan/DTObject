//
//  DTProperty.h
//  DTObjectExample
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, DTPropertyDataType) {
    DTPropertyDataTypeUnknown,
    DTPropertyDataTypeBase,
    DTPropertyDataTypePointer,
    DTPropertyDataTypeId,
};

@interface DTProperty : NSObject

@property (nonatomic, assign) Class cls;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *code;
@property (nonatomic, readonly) DTPropertyDataType dataType;
@property (nonatomic, readonly) Class dataTypeClass;
@property (nonatomic, readonly) BOOL isFoundationClass;

+ (instancetype)propertyWithObjcProperty:(objc_property_t)property;
- (instancetype)initWithObjcProperty:(objc_property_t)property;

@end
