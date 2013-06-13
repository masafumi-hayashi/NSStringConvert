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
    self.pred = @"SELF=='a'".pred;
}

- (void)testConvertPredicate
{
    STAssertEqualObjects(self.pred, [NSPredicate predicateWithFormat:@"SELF=='a'"], nil);
    
    NSArray * sample = @[@"a", @"b", @"a", @"bc"];
    STAssertTrue([[sample filteredArrayUsingPredicate:self.pred] count]==2, nil);
}
@end
