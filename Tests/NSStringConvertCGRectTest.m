//
//  NSStringConvertCGRectTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGRectTest.h"
#import "NSString+Convert.h"

static BOOL test10x10(NSString * a)
{
    return CGRectEqualToRect(a.CGRect, CGRectMake(0, 0, 10, 10));
}

@implementation NSStringConvertCGRectTest
- (void)testConvert
{
    STAssertTrue(test10x10(@"{{0,0},{10,10}}"), nil);
    STAssertTrue(test10x10(@"{0,0,10,10}"), nil);
    STAssertTrue(test10x10(@"{0,0},{10,10}"), nil);
    STAssertTrue(test10x10(@"0,0,10,10"), nil);
    STAssertTrue(test10x10(@"0,0,10"), nil);
    STAssertTrue(test10x10(@"10,10"), nil);
    STAssertTrue(test10x10(@"10"), nil);
    
    STAssertTrue(CGRectEqualToRect(@"".CGRect, CGRectZero), nil);
}
@end
