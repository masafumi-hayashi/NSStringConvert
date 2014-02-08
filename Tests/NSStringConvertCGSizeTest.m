//
//  NSStringConvertCGSizeTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGSizeTest.h"
#import "NSString+Convert.h"

static BOOL test10x10(NSString* a)
{
    return CGSizeEqualToSize(a.CGSize, CGSizeMake(10, 10));
}

@implementation NSStringConvertCGSizeTest
- (void)testConvertCGSize
{
    STAssertTrue(test10x10(@"{10,10}"), nil);
    STAssertTrue(test10x10(@"10,10"), nil);
    STAssertTrue(test10x10(@"10 10"), nil);
    STAssertTrue(test10x10(@"10"), nil);
    STAssertTrue(test10x10(@"{10,10"), nil);
}

@end
