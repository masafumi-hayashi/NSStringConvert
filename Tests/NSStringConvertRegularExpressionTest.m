//
//  NSStringConvertRegularExpression.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/12/13.
//
//

#import "NSStringConvertRegularExpressionTest.h"
#import "NSString+Convert.h"
@interface NSStringConvertRegularExpressionTest ()
@property (nonatomic) NSRegularExpression * regexp;
@end

@implementation NSStringConvertRegularExpressionTest
- (void)setUp
{
    self.regexp = @"^[0-9]+$".regexp;
}

- (void)testConvertRegularExpression
{
    NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]+$"
                                                                             options:0
                                                                               error:nil];
    STAssertEqualObjects(self.regexp, regexp, nil);
    
    STAssertTrue([self numberOfMatches:@"1"] == 1, nil);
    STAssertTrue([self numberOfMatches:@"a"] == 0, nil);
    STAssertTrue([self numberOfMatches:@"a1"] == 0, nil);
    STAssertTrue([self numberOfMatches:@"1a"] == 0, nil);
}

- (void)testNotWellFormed
{
    NSRegularExpression * regexp = @"test\\".regexp;
    STAssertNil(regexp, nil);
}

- (NSUInteger)numberOfMatches:(NSString *)text
{
    return [[self.regexp matchesInString:text
                                options:0
                                  range:NSMakeRange(0, [text length])] count];
}
@end
