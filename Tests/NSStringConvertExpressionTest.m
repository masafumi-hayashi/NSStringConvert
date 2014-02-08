//
//  NSStringConvertExpressionTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 2/9/14.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+Convert.h"
@interface NSStringConvertExpressionTest : SenTestCase
@property (nonatomic) NSExpression * exp;
@end

@implementation NSStringConvertExpressionTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    _exp = [NSExpression expressionWithFormat:@"1+1"];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testConvert
{
    STAssertEqualObjects(@"1+1".exp, _exp, nil);
    STAssertFalse([@"1+1" isEqual:_exp], nil);
}
@end
