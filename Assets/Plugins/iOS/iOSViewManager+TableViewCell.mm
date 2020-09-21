//
//  iOSViewManager+TableViewCell.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 5/10/14.
//
//

#import "iOSViewManager+TableViewCell.h"
#define CANNOT_FIND_ERROR @"ERROR: Cannot find UITableViewCell"

@implementation iOSViewManager (TableViewCell)

@end

extern "C"
{
    int _init_tableviewcell(int tag)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewCell *cell = [[[ALBTableViewCell alloc] init] autorelease];
            
            [MHTools addreplaceObject:cell key:tag actualUI:cell];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (TABLEVIEWCELL)");
        }
        return tag;
	}
	
	int _initWithFrame_tableviewcell(int tag, const char * aRect)
	{
		if(![MHTools objectExists:tag])
        {
            CGRect frame = [MHTools convertRectToCGRect:aRect];
            ALBTableViewCell *cell = [[[ALBTableViewCell alloc] initWithFrame:frame] autorelease];
            
            [MHTools addreplaceObject:cell key:tag actualUI:cell];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (LABEL)");
        }
        return tag;
	}
	
	int _initWithStyleReuseIdentifier_tableviewcell(int tag, int style, const char * reuseIdentifier)
	{
		if(![MHTools objectExists:tag])
        {
            ALBTableViewCell *cell = [[[ALBTableViewCell alloc] initWithStyle:(UITableViewCellStyle)style reuseIdentifier:GetStringParamOrNil(reuseIdentifier)] autorelease];
            
            [MHTools addreplaceObject:cell key:tag actualUI:cell];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (LABEL)");
        }
        return tag;
	}
	
	int _selectedBackgroundView(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.selectedBackgroundView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _selectedBackgroundView_set(int tag, int view)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.selectedBackgroundView = [MHTools getActualView:view];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _multipleSelectionBackgroundView(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.multipleSelectionBackgroundView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _multipleSelectionBackgroundView_set(int tag, int view)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.multipleSelectionBackgroundView = [MHTools getActualView:view];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _accessoryType(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return (int)tvc.accessoryType;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return UITableViewCellAccessoryNone;
	}
	
	void _accessoryType_set(int tag, int type)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.accessoryType = (UITableViewCellAccessoryType)type;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _accessoryView(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.accessoryView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _accessoryView_set(int tag, int view)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.accessoryView = [MHTools getActualView:view];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _editingAccessoryType(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return (int)tvc.editingAccessoryType;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return UITableViewCellAccessoryNone;
	}
	
	void _editingAccessoryType_set(int tag, int type)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.editingAccessoryType = (UITableViewCellAccessoryType)type;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _editingAccessoryView(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return [MHTools getKeyFromActual:tvc.editingAccessoryView];
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _editingAccessoryView_set(int tag, int view)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.editingAccessoryView = [MHTools getActualView:view];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _selectionStyle(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return (int)tvc.selectionStyle;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return UITableViewCellSelectionStyleDefault;
	}
	
	void _selectionStyle_set(int tag, int style)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.selectionStyle = (UITableViewCellSelectionStyle)style;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _setSelected(int tag, bool selected, bool animated)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            [tvc setSelected:selected animated:animated];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	void _setHighlighted(int tag, bool highlighted, bool animated)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            [tvc setHighlighted:highlighted animated:animated];
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _editingStyle(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return (int)tvc.editingStyle;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return UITableViewCellEditingStyleNone;
	}
	
	bool _showingDeleteConfirmation(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.showingDeleteConfirmation;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return false;
	}
	
	bool _showsReorderControl(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.showsReorderControl;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return false;
	}
	
	void _showsReorderControl_set(int tag, bool shows)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.showsReorderControl = shows;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	int _indentationLevel(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.indentationLevel;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0;
	}
	
	void _indentationLevel_set(int tag, int level)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.indentationLevel = level;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	float _indentationWidth(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.indentationWidth;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return 0.0f;
	}
	
	void _indentationWidth_set(int tag, float width)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.indentationWidth = width;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	bool _shouldIndentWhileEditing(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            return tvc.shouldIndentWhileEditing;
        }
        
        NSLog(CANNOT_FIND_ERROR);
		return false;
	}
	
	void _shouldIndentWhileEditing_set(int tag, bool should)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        
        if(tvc)
        {
            tvc.shouldIndentWhileEditing = should;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
	
	const char * _separatorInset(int tag)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        if(tvc)
        {
            UIEdgeInsets sepinset = tvc.separatorInset;
            return [MHTools convertUIEdgeInsetToVector4:sepinset];
        }
        
        NSLog(CANNOT_FIND_ERROR);
        return "";
	}
	
	void _separatorInset_set(int tag, const char * inset)
	{
		UITableViewCell *tvc = [MHTools getActualObject:tag];
        if(tvc)
        {
            UIEdgeInsets sepinset = [MHTools convertVector4ToUIEdgeInset:inset];
            tvc.separatorInset = sepinset;
            return;
        }
        
        NSLog(CANNOT_FIND_ERROR);
	}
}