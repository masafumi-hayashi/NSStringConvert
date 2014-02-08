//
//  NSStringConvertCGAffineTransformTest.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/14/13.
//
//

#import "NSStringConvertCGAffineTransformTest.h"
#import "NSString+Convert.h"

#define test(a, b) CGAffineTransformEqualToTransform(a, b)
#define testScale(t,a,b) test(t, CGAffineTransformMakeScale(a, b))
#define testScale2x2(t) testScale(t,2,2)
#define testRotate(t,a) test(t, CGAffineTransformMakeRotation(a))
#define testRotate2(t) testRotate(t,2)
#define testTranslation(t,a,b) test(t, CGAffineTransformMakeTranslation(a, b))
#define testTranslation2x2(t) testTranslation(t,2,2)

@implementation NSStringConvertCGAffineTransformTest
- (void)testConvertCGAffineTransform
{
    STAssertTrue(testScale2x2(@"{2,0,0,2,0,0}".CGAffineTransform), nil);
    STAssertTrue(testScale2x2(@"2,0,0,2,0,0".CGAffineTransform), nil);
}

- (void)testNotWellFormed
{
    STAssertFalse(testScale2x2(@"{2,0,0/2,0,0}".CGAffineTransform), nil);
}

- (void)testConvertScale
{
    STAssertTrue(testScale2x2(@"2,2".Scale), nil);
    STAssertTrue(testScale(@"2.5,1.5".Scale, 2.5, 1.5), nil);
}

- (void)testConvertTranslation
{
    STAssertTrue(testTranslation2x2(@"2,2".Translation), nil);
    STAssertTrue(testTranslation(@"2.5,1.5".Translation, 2.5, 1.5), nil);
}

- (void)testConvertRotate
{
    STAssertTrue(testRotate2(@"2".Rotation), nil);
    STAssertTrue(testRotate(@"2.5".Rotation, 2.5), nil);
}
@end
