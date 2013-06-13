//
//  NSStringConvertURLTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/13/13.
//
//

#import "NSStringConvertURLTest.h"
#import "NSString+Convert.h"

@interface NSStringConvertURLTest ()
@property (nonatomic) NSURL * url;
@end

@implementation NSStringConvertURLTest

- (void)setUp
{
    self.url = [NSURL URLWithString:@"http://localhost"];
}

- (void)testConvertURL
{
    STAssertEqualObjects(@"http://localhost".url, self.url, nil);
}
@end
