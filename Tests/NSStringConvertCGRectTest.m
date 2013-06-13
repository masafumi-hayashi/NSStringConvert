//
//  NSStringConvertCGRectTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGRectTest.h"
#import "NSString+Convert.h"

@implementation NSStringConvertCGRectTest
- (void)testConvertCGRect
{
    STAssertTrue(CGRectEqualToRect(@"{{0,0},{10,10}}".CGRect, CGRectMake(0, 0, 10, 10)), nil);
}

- (void)testNotWellFormed
{
    STAssertTrue(CGRectEqualToRect(@"{1,1},{1,1}".CGRect, CGRectZero), nil);
}
@end
