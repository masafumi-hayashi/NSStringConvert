//
//  NSStringConvertArrayTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/20/13.
//
//

#import "NSStringConvertArrayTest.h"
#import "NSString+Convert.h"
@implementation NSStringConvertArrayTest
- (void)testConvertArray
{
    NSArray * data = @"hello world".array;
    STAssertTrue([data.class isSubclassOfClass:[NSArray class]], nil);
    STAssertTrue([data count] == 11, nil);
    STAssertTrue([data[0] isEqualToString:@"h"], nil);
}
@end
