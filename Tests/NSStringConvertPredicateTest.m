//
//  NSStringConvertTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/11/13.
//
//

#import "NSStringConvertPredicateTest.h"
#import "NSString+Convert.h"

@interface NSStringConvertPredicateTest ()
@property (nonatomic) NSPredicate * pred;
@end

@implementation NSStringConvertPredicateTest
- (void)setUp
{
    _pred = [NSPredicate predicateWithFormat:@"SELF=='a'"];
}

- (void)testConvertPredicate
{
    STAssertEqualObjects(@"SELF=='a'".pred, _pred, nil);
    
    NSArray * sample = @[@"a", @"b", @"a", @"bc"];
    STAssertTrue([[sample filteredArrayUsingPredicate:_pred] count]==2, nil);
}
@end
