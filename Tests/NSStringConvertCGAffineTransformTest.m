//
//  NSStringConvertCGAffineTransformTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGAffineTransformTest.h"
#import "NSString+Convert.h"
@implementation NSStringConvertCGAffineTransformTest
- (void)testConvertCGAffineTransform
{
    CGAffineTransform a = @"{2,0,0,2,0,0}".CGAffineTransform;
    CGAffineTransform b = CGAffineTransformMakeScale(2, 2);
    STAssertTrue(CGAffineTransformEqualToTransform(a, b), nil);
}

- (void)testNotWellFormed
{
    CGAffineTransform a = @"2,0,0.2,0,0".CGAffineTransform;
    CGAffineTransform b = CGAffineTransformMakeScale(2, 2);
    STAssertFalse(CGAffineTransformEqualToTransform(a, b), nil);
}
@end
