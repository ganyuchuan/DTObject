//
//  DTObjectExampleTests.m
//  DTObjectExampleTests
//
//  Created by huxiu on 2016/10/19.
//  Copyright © 2016年 ganyuchuan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import "Object.h"

/*!
 *  参考接口说明，https://github.com/izzyleung/ZhihuDailyPurify/wiki/知乎日报-API-分析。
 */

@interface DTObjectExampleTests : XCTestCase

@end

@implementation DTObjectExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)requestURLString:(NSString *)url responseObjectClass:(Class)cls {
    XCTAssert(url, @"Parameter ‘url’ could not nil.");
    XCTAssert(cls || [cls isSubclassOfClass:[DTObject class]], @"Parameter ‘cls’ could not nil or must inherit 'DTObject' class.");
    
    NSString *className = NSStringFromClass(cls);
    XCTestExpectation *expectation = [self expectationWithDescription:className];
    __block BOOL flag;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id object = [cls objectWithKeyValues:responseObject];
        NSLog(@"%@ %@", className, [object keyValues]);
        
        flag = object ? YES : NO;
        [expectation fulfill];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        flag = error ? YES : NO;
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        flag = error ? NO : flag;
    }];
    
    XCTAssert(flag, @"Test complete.");
}

- (void)testStartImage {
    [self requestURLString:@"http://news-at.zhihu.com/api/4/start-image/640*960" responseObjectClass:[StartImage class]];
}

- (void)testAppVersion {
    [self requestURLString:@"http://news-at.zhihu.com/api/4/version/ios/2.3.0" responseObjectClass:[AppVersion class]];
}

- (void)testNewsLatest {
    [self requestURLString:@"http://news-at.zhihu.com/api/4/news/latest" responseObjectClass:[NewsLatest class]];
}

- (void)testNews {
    [self requestURLString:@"http://news-at.zhihu.com/api/4/news/3892357" responseObjectClass:[News class]];
}

@end
