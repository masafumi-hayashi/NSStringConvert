//
//  NSStringConvertCGPointTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGPointTest.h"
#import "NSString+Convert.h"
@implementation NSStringConvertCGPointTest
- (void)testConvertCGPoint
{
    STAssertTrue(CGPointEqualToPoint(@"{10,10}".CGPoint, CGPointMake(10, 10)), nil);
}

- (void)testNotWellFormed
{
    STAssertFalse(CGPointEqualToPoint(@"{10,10".CGPoint, CGPointMake(10, 10)), nil);
}
@end
