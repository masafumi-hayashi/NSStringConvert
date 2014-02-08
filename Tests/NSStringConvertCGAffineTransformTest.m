//
//  NSStringConvertCGAffineTransformTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGAffineTransformTest.h"
#import "NSString+Convert.h"

static BOOL test(CGAffineTransform a, CGAffineTransform b)
{
    return CGAffineTransformEqualToTransform(a, b);
}

static BOOL testScale2x2(NSString * a)
{
    return test(a.CGAffineTransform, CGAffineTransformMakeScale(2, 2));
}

@implementation NSStringConvertCGAffineTransformTest
- (void)testConvertCGAffineTransform
{
    STAssertTrue(testScale2x2(@"{2,0,0,2,0,0}"), nil);
    STAssertTrue(testScale2x2(@"2,0,0,2,0,0"), nil);
}

- (void)testNotWellFormed
{
    STAssertFalse(testScale2x2(@"{2,0,0/2,0,0}"), nil);
}
@end
