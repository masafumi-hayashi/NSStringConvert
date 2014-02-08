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
    NSString * tmp = self;
    if (len > 2 && utf[0]=='{' && utf[len-1] == '}') {
        tmp = [self _replacedString];
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

- (NSString *)_replacedString
{
    NSMutableString * tmp = self.mutableCopy;
    NSUInteger len = [tmp length];
    NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:@"[\\{\\}]"
                                                                             options:0
                                                                               error:nil];
    [regexp replaceMatchesInString:tmp
                           options:0
                             range:NSMakeRange(0, len)
                      withTemplate:@" "];
    return tmp;
}

- (CGSize)CGSize
{
    const char * utf = [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 2 && utf[0]=='{' && utf[len-1] == '}') {
       return CGSizeFromString(self);
    }
    
    NSString * tmp = [self _replacedString];
    NSArray * n = [tmp componentsSeparatedByString:@","];
    if ([n count] == 2) {
        return CGSizeMake([n[0] doubleValue], [n[1] doubleValue]);
    }
    else if ([n count] == 1) {
        return CGSizeMake([n[0] doubleValue], [n[0] doubleValue]);
    }
    
    return CGSizeZero;
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
