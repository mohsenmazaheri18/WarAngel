//
//  ALBPickerView.m
//  Unity-iPhone
//
//  Created by Matthew Scuderi on 9/12/13.
//
//

#import "ALBPickerView.h"

@implementation ALBPickerView

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

#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    int comp = component;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          [NSNumber numberWithInt:comp], @"rowHeightForComponent",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"pickerViewRowHeightForComponent" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    int comp = component;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          [NSNumber numberWithInt:comp], @"widthForComponent",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"pickerViewWidthForComponent" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result floatValue];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    int rw = row;
    int comp = component;
    int rView = 0;
    if(view != nil && [MHTools actualObjectExistsByObject:view])
        rView = [MHTools getKeyFromActual:view];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          [NSNumber numberWithInt:rw], @"row",
                          [NSNumber numberWithInt:comp], @"forComponent",
                          [NSNumber numberWithInt:rView], @"reusingView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"pickerViewViewForRow" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    int viewTag = [result intValue];
    
    if([result isEqualToString:@"NULL"])
        return nil;
    
    return [MHTools getActualView:viewTag];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    int rw = row;
    int comp = component;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          [NSNumber numberWithInt:rw], @"row",
                          [NSNumber numberWithInt:comp], @"component",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"pickerViewDidSelectRow" JSONPARAM:jsonResult];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"numberOfComponentsInPickerView" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int tag = [MHTools getKeyFromActual:self];
    int pView = [MHTools getKeyFromActual:pickerView];
    int comp = component;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:tag], @"tag",
                          [NSNumber numberWithInt:pView], @"pickerView",
                          [NSNumber numberWithInt:comp], @"component",
                          nil];
    const char *jsonResult = MakeStringCopy([dict JSONString]);
    
    [iOSViewManager UnitySendInstantMessage:"pickerViewNumberOfRowsInComponent" JSONPARAM:jsonResult];
    
    NSString *result =  GetStringParamOrNil([[iOSViewManager sharedManager] _result]);
    [iOSViewManager sharedManager]._result = "NULL";
    
    return [result intValue];
}

@end