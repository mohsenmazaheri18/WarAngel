//
//  iOSViewManager+Responder.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 4/26/14.
//
//

#import "iOSViewManager+Responder.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UIResponder"

@implementation iOSViewManager (Responder)

@end

extern "C"
{
    int _nextResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [MHTools getKeyFromActual:[responder nextResponder]];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return 0;
	}
	
	bool _isFirstResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [responder isFirstResponder];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	bool _canBecomeFirstResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [responder canBecomeFirstResponder];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	bool _becomeFirstResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [responder becomeFirstResponder];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	bool _canResignFirstResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [responder canResignFirstResponder];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	bool _resignFirstResponder(int tag)
	{
		UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            return [responder resignFirstResponder];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return false;
	}
	
	void _reloadInputViews(int tag)
    {
        UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            [responder reloadInputViews];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
    }
    
    void _refreshResponder(int tag, bool began, bool moved, bool ended, bool cancelled)
    {
        UIResponder *responder = [MHTools getActualObject:tag];
        if(responder)
        {
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [NSNumber numberWithInt:tag], @"tag",
                                  [NSNumber numberWithBool:began], @"touchesBeganIsValid",
                                  [NSNumber numberWithBool:moved], @"touchesMovedIsValid",
                                  [NSNumber numberWithBool:ended], @"touchesEndedIsValid",
                                  [NSNumber numberWithBool:cancelled], @"touchesCancelledIsValid",
                                  nil];
            [[[iOSViewManager sharedManager] _allResponderSubs] setObject:[dict JSONString] forKey:[NSNumber numberWithInt:tag]];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
    }
}