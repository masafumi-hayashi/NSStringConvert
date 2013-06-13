//
//  NSStringConvertCGSizeTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGSizeTest.h"
#import "NSString+Convert.h"
@implementation NSStringConvertCGSizeTest
- (void)testConvertCGSize
{
    STAssertTrue(CGSizeEqualToSize(@"{10,10}".CGSize, CGSizeMake(10, 10)), nil);
}

- (void)testNotWellFormed
{
    STAssertFalse(CGSizeEqualToSize(@"{10,10".CGSize, CGSizeMake(10, 10)), nil);
}
@end
