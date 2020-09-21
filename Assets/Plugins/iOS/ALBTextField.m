//
//  ALBTextField.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 9/19/13.
//
//

#import "ALBTextField.h"

@implementation ALBTextField

#pragma mark UIResponderCallbacks
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesBeganIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesBegan:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesMovedIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesMoved:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesEndedIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesEnded:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([MHTools touchesCancelledIsValid:[MHTools getKeyFromActual:self]])
        [ALBResponder touchesCancelled:[MHTools getKeyFromActual:self] touches:touches withEvent:event];
    [super touchesCancelled:touches withEvent:event];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionBegan:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionEnded:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [ALBResponder motionCancelled:[MHTools getKeyFromActual:self] motion:motion withEvent:event];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    [ALBResponder remoteControlReceivedWithEvent:[MHTools getKeyFromActual:self] event:event];
}

#pragma mark BaseCallbacks
- (void)animationDidStart:(NSString *)animationID context:(void *)context
{
    [ALBView animationDidStart:[MHTools getKeyFromActual:self] animationID:animationID context:context];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [ALBView animationDidStop:[MHTools getKeyFromActual:self] animationID:animationID finished:finished context:context];
}

- (void)didAddSubview:(UIView *)subview
{
    if(![MHTools actualObjectExistsByObject:subview])
        return;
    [ALBView didAddSubview:[MHTools getKeyFromActual:self] subView:subview];
}

- (void)willRemoveSubview:(UIView *)subview
{
    if(![MHTools actualObjectExistsByObject:subview])
        return;
    [ALBView willRemoveSubview:[MHTools getKeyFromActual:self] subView:subview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if(![MHTools actualObjectExistsByObject:newSuperview])
        return;
    [ALBView willMoveToSuperview:[MHTools getKeyFromActual:self] superView:newSuperview];
}

- (void)didMoveToSuperview
{
    [ALBView didMoveToSuperview:[MHTools getKeyFromActual:self]];
    
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldShouldBeginEditing" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldDidBeginEditing" JSONPARAM:jsonResult];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldShouldEndEditing" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldDidEndEditing" JSONPARAM:jsonResult];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldShouldClear" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    int tag = [MHTools getKey:self];
    int tField = [MHTools getKeyFromActual:textField];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:tField], @"textField",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textFieldShouldReturn" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if([result isEqualToString:@"true"])
        return true;
    return false;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return true;
}
#pragma mark drawing and positioning

- (CGRect) textRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"textRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (void) drawTextInRect:(CGRect)rect
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return;
    NSString *rct = GetStringParam([MHTools convertCGRectToRect:rect]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          rct, @"rect",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"drawTextInRect" JSONPARAM:jsonResult];
    
    [super drawTextInRect:rect];
}

- (CGRect) placeholderRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"placeholderRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (void) drawPlaceholderInRect:(CGRect)rect
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return;
    NSString *rct = GetStringParam([MHTools convertCGRectToRect:rect]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          rct, @"rect",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"drawPlaceholderInRect" JSONPARAM:jsonResult];
    
    [super drawPlaceholderInRect:rect];
}

- (CGRect) borderRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"borderRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (CGRect) editingRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"editingRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (CGRect) clearButtonRectForBounds:(CGRect)bounds
{
    bounds = [super clearButtonRectForBounds:bounds];
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"clearButtonRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (CGRect) leftViewRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"leftViewRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}

- (CGRect) rightViewRectForBounds:(CGRect)bounds
{
    int tag = [MHTools getKey:self showWarning:false];
    if(tag == 0)
        return bounds;
    NSString *bnds = GetStringParam([MHTools convertCGRectToRect:bounds]);
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          bnds, @"bounds",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"rightViewRectForBounds" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    if(result == nil || [result isEqualToString:@"NULL"])
        return bounds;
    return [MHTools convertRectToCGRect:MakeStringCopy(result)];
}
@end
