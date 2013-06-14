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
