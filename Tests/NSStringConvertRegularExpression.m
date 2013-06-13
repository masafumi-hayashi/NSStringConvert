//
//  NSStringConvertRegularExpression.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/12/13.
//
//

#import "NSStringConvertRegularExpression.h"
#import "NSString+Convert.h"
@interface NSStringConvertRegularExpression ()
@property (nonatomic) NSRegularExpression * regexp;
@end

@implementation NSStringConvertRegularExpression
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

- (NSUInteger)numberOfMatches:(NSString *)text
{
    return [[self.regexp matchesInString:text
                                options:0
                                  range:NSMakeRange(0, [text length])] count];
}
@end
