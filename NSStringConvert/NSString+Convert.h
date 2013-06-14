//
//  NSString+Convert.h
//  NSStringConvert
//
//  Created by masafumi hayashi on 6/11/13.
//
//



@interface NSString (Convert)
- (NSPredicate *)pred;
- (NSRegularExpression *)regexp;
- (NSURL *)url;
- (NSRange)range;
- (CGRect)CGRect;
- (CGSize)CGSize;
- (CGPoint)CGPoint;
- (CGAffineTransform)CGAffineTransform;
@end
