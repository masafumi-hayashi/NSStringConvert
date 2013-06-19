//
//  NSString+Convert.m
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/11/13.
//
//

#import "NSString+Convert.h"

@implementation NSString (Convert)
- (NSPredicate *)pred
{
    return [NSPredicate predicateWithFormat:self];
}

- (NSRegularExpression *)regexp
{
    return [NSRegularExpression regularExpressionWithPattern:self
                                                     options:0
                                                       error:nil];
}

- (NSURL *)url
{
    return [NSURL URLWithString:self];
}

- (NSRange)range
{
    return NSRangeFromString(self);
}

- (NSArray *)array
{
    NSMutableArray * result = @[].mutableCopy;
    const NSUInteger length = self.length;
    for (NSUInteger i = 0; i < length; i++) {
        [result addObject:[self substringWithRange:NSMakeRange(i, 1)]];
    }
    return result;
}

- (CGRect)CGRect
{
    return CGRectFromString(self);
}

- (CGSize)CGSize
{
    return CGSizeFromString(self);
}

- (CGPoint)CGPoint
{
    return CGPointFromString(self);
}

- (CGAffineTransform)CGAffineTransform
{
    return CGAffineTransformFromString(self);
}
@end
