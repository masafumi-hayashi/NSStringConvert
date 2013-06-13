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
    NSError * error;
    NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:self
                                                                             options:0
                                                                               error:&error];
    if (error) {
        [NSException exceptionWithName:NSInvalidArgumentException
                                reason:[error localizedFailureReason]
                              userInfo:@{@"error": error}];
    }
    return regexp;
}

- (NSURL *)url
{
    return [NSURL URLWithString:self];
}
@end
