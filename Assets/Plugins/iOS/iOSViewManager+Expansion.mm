//
//  iOSViewManager+Expansion.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 9/16/13.
//
//

#import "iOSViewManager+Expansion.h"

@implementation iOSViewManager (Expansion)

@end

extern "C"
{
    // Sync Auto-Created Items Expansion
    void _syncToolbar(int tag, int navController)
	{
		UINavigationController *navcontroller = [MHTools getActualObject:navController];
        if(navcontroller)
        {
            ALBToolbar *toolbar = (ALBToolbar *)navcontroller.toolbar;
            
            [MHTools addreplaceObject:toolbar key:tag actualUI:toolbar];
        }
	}
	
	void _syncNavbar(int tag, int navController)
    {
        UINavigationController *navcontroller = [MHTools getActualObject:navController];
        if(navcontroller)
        {
            ALBNavigationBar *navbar = (ALBNavigationBar *)navcontroller.navigationBar;
            
            [MHTools addreplaceObject:navbar key:tag actualUI:navbar];
        }
    }
}