//
//  NSStringConvertRangeTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/15/13.
//
//

#import "NSStringConvertRangeTest.h"
#import "NSString+Convert.h"
@implementation NSStringConvertRangeTest
- (void)testConvertRange
{
    STAssertTrue(NSEqualRanges(@"{1,1}".range, NSMakeRange(1, 1)), nil);
    STAssertTrue(NSEqualRanges(@"1a1".range, NSMakeRange(1, 1)), nil);
}

- (void)testNotWellFormed
{
    STAssertTrue(NSEqualRanges(@"a".range, NSMakeRange(0, 0)), nil);
}

- (void)testStringContainsOneInteger
{
    STAssertTrue(NSEqualRanges(@"1,a".range, NSMakeRange(1, 0)), nil);
    STAssertTrue(NSEqualRanges(@"a,1".range, NSMakeRange(1, 0)), nil);
    STAssertTrue(NSEqualRanges(@"1".range, NSMakeRange(1, 0)), nil);
    
}
@end
