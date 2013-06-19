
NSStringConvert
===============

NSStringから様々な型に変換する拡張

[NSArray]: #nsarray
[NSPredicate]: #nspredicate
[NSRegularExpression]: #nsregularexpression
[NSRange]: #nsrange
[NSURL]: #nsurl
[CGAffineTransform]: #cgaffinetransform
[CGPoint]: #cgpoint
[CGRect]: #cgrect
[CGSize]: #cgsize

* [NSArray]
* [NSPredicate]
* [NSRegularExpression]
* [NSRange]
* [NSURL]
* [CGAffineTransform]
* [CGPoint]
* [CGRect]
* [CGSize]

### NSArray
#### Before
    NSString * str = @"text";
    NSMutableArray * result = @[].mutableCopy;
    const NSUInteger length = str.length;
    for (NSUInteger i = 0; i < length; i++) {
        NSString * s = [str substringWithRange:NSMakeRange(i, 1)];
        [result addObject:s];
    }
#### After
    @"text".array


### NSRegularExpression
#### Before
    [NSRegularExpression regularExpressionWithPattern:@"text"
                                              options:0
                                                error:nil]
#### After
    @"text".regexp

### NSPredicate
#### Before
    [NSPredicate predicateWithFormat:@"text"]
#### After
    @"text".pred

### NSRange
#### Before
    NSRangeFromString(@"1,1")
#### After
    @"1,1".range

### NSURL
#### Before
    [NSURL URLWithString:@"text"]
#### After
    @"text".url
  
### CGAffineTransform
#### Before
    NSStringFromCGAffineTransform(@"{1,0,0,1,0,0}")
#### After
    @"{1,0,0,1,0,0}".CGAffineTransform

### CGPoint
#### Before
    NSStringFromCGPoint(@"{1,1}")
#### After
    @"{1,1}".CGPoint

### CGRect
#### Before
    NSStringFromCGRect(@"{{0,0},{10,10}}")
#### After
    @"{{0,0},{10,10}}".CGRect

### CGSize
#### Before
    NSStringFromCGSize(@"{10,10}")
#### After
    @"{10,10}".CGSize
