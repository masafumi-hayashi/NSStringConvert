//
//  NSStringConvertCGPointTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGPointTest.h"
#import "NSString+Convert.h"
static BOOL test10x10(NSString* a)
{
    return CGPointEqualToPoint(a.CGPoint, CGPointMake(10, 10));
}
@implementation NSStringConvertCGPointTest
- (void)testConvertCGPoint
{
    STAssertTrue(test10x10(@"{10,10}"), nil);
    STAssertTrue(test10x10(@"10,10"), nil);
    STAssertTrue(test10x10(@"10 10"), nil);
    STAssertTrue(test10x10(@"{10,10"), nil);
}

@end
