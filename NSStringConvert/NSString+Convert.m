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

- (NSExpression *)exp
{
    return [NSExpression expressionWithFormat:self];
}

- (CGRect)CGRect
{
    const char* utf =  [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 4 && utf[0] == '{' && utf[1] == '{' && utf[len-2] == '}' && utf[len-1] == '}') {
        return CGRectFromString(self);
    }
    
    NSArray* n = [self _components:[self _replacedString]];
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

- (NSArray *)_components:(NSString *)str
{
    return [str componentsSeparatedByString:[self _maybeCommaSepareted]? @",":@" "];
}

- (BOOL)_maybeCommaSepareted
{
    const char* utf = [self UTF8String];
    const NSUInteger len = [self length];
    for (int i = 0; i< len; i++) {
        if (utf[i]==',') {
            return YES;
        }
    }
    return NO;
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
                      withTemplate:@""];
    return tmp;
}

- (CGSize)CGSize
{
    const char * utf = [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 2 && utf[0]=='{' && utf[len-1] == '}') {
       return CGSizeFromString(self);
    }
    
    NSArray * n = [self _components:[self _replacedString]];
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
    const char * utf = [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 2 && utf[0]=='{' && utf[len-1] == '}') {
        return CGPointFromString(self);
    }
    
    NSArray * n = [self _components:[self _replacedString]];
    if ([n count] == 2) {
        return CGPointMake([n[0] doubleValue], [n[1] doubleValue]);
    }
    return CGPointZero;
}

- (CGAffineTransform)CGAffineTransform
{
    const char * utf = [self UTF8String];
    const NSUInteger len = [self length];
    if (len > 2 && utf[0]=='{' && utf[len-1]=='}') {
        return CGAffineTransformFromString(self);
    }
    NSArray * n = [self _components:[self _replacedString]];
    if ([n count] == 6) {
        return CGAffineTransformMake([n[0] doubleValue],
                                     [n[1] doubleValue],
                                     [n[2] doubleValue],
                                     [n[3] doubleValue],
                                     [n[4] doubleValue],
                                     [n[5] doubleValue]);
    }
    return CGAffineTransformIdentity;
}
@end
