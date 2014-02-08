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
    const char* utf =  [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 4 && utf[0] == '{' && utf[1] == '{' && utf[len-2] == '}' && utf[len-1] == '}') {
        return CGRectFromString(self);
    }
    NSMutableString * tmp = self.mutableCopy;
    if (len > 2 && utf[0]=='{' && utf[len-1] == '}') {
        NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:@"[\\{\\}]"
                                                                                 options:0
                                                                                   error:nil];
        [regexp replaceMatchesInString:tmp
                               options:0
                                 range:NSMakeRange(0, len)
                          withTemplate:@" "];
    }
    
    NSArray* n = [tmp componentsSeparatedByString:@","];
    if ([n count] == 4) {
        return CGRectMake([n[0] doubleValue],
                          [n[1] doubleValue],
                          [n[2] doubleValue],
                          [n[3] doubleValue]);
    }
    else if ([n count] == 3) {
        return CGRectMake([n[0] doubleValue],
                          [n[1] doubleValue],
                          [n[2] doubleValue],
                          [n[2] doubleValue]);
    }
    else if([n count] == 2) {
        return CGRectMake(0, 0, [n[0] doubleValue], [n[1] doubleValue]);
    }
    else if([n count] == 1) {
        return CGRectMake(0, 0, [n[0] doubleValue], [n[0] doubleValue]);
    }
    return CGRectZero;
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
