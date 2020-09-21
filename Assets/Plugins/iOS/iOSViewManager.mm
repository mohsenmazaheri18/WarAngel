//
//  iOSViewManager.m
//  Unity-iPhone
//
//  Created by Patrick Antoine on 8/6/13.
//
//

#import "iOSViewManager.h"

void UnityPause( int pause );
void UnitySendMessage( const char * className, const char * methodName, const char * param );
UIViewController *UnityGetGLViewController();

extern "C"
{
    void UnitySendInstantMessage(const char * methodName, const char* jsonresult);
    void RegisterInstantMessageReceiver();
}

@implementation iOSViewManager

@synthesize _allObjects, _allActualUIElements, _allResponderSubs, _result, _instantMessageMethod;

+ (iOSViewManager*)sharedManager
{
    static iOSViewManager *sharedManager = nil;
    if( !sharedManager )
    {
        sharedManager = [[iOSViewManager alloc] init];
        RegisterInstantMessageReceiver();
    }
    
    return sharedManager;
}

- (id)init
{
    if( ( self = [super init] ) )
    {
        _allObjects = [[NSMutableDictionary alloc] initWithCapacity: 100];
        _allActualUIElements = [[NSMutableDictionary alloc] initWithCapacity: 100];
        _allResponderSubs = [[NSMutableDictionary alloc] initWithCapacity:100];
        
        [[NSUserDefaults standardUserDefaults] addObserver:self
                                                forKeyPath:@"MHResult"
                                                   options:0
                                                   context:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide) name:UIKeyboardDidHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame) name:UIKeyboardWillChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

+ (UIViewController*)unityViewController
{
    return UnityGetGLViewController();
}

+ (void) UnitySendInstantMessage:(const char *) methodName JSONPARAM:(const char*) jsonresult
{
    UnitySendInstantMessage(methodName, jsonresult);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // Command result parsing goes here
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:@"MHResult"]
        isEqualToString:@"NULL"])
    {
        _result = MakeStringCopy([[NSUserDefaults standardUserDefaults] objectForKey:@"MHResult"]);
        [[NSUserDefaults standardUserDefaults] setObject:@"NULL" forKey:@"MHResult"];
    }
}

- (void) keyboardWillShow
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardWillShow" JSONPARAM:""];
}

- (void) keyboardDidShow
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardDidShow" JSONPARAM:""];
}

- (void) keyboardWillHide
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardWillHide" JSONPARAM:""];
}

- (void) keyboardDidHide
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardDidHide" JSONPARAM:""];
}

- (void) keyboardWillChangeFrame
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardWillChangeFrame" JSONPARAM:""];
}

- (void) keyboardDidChangeFrame
{
    [iOSViewManager UnitySendInstantMessage:"_keyboardDidChangeFrame" JSONPARAM:""];
}

@end

typedef void* MonoDomain;
typedef void* MonoAssembly;
typedef void* MonoImage;
typedef void* MonoClass;
typedef void* MonoObject;
typedef void* MonoMethodDesc;
typedef void* MonoMethod;
typedef void* MonoString;
typedef int gboolean;

extern "C"
{
    MonoDomain *mono_domain_get();
    MonoAssembly *mono_domain_assembly_open(MonoDomain *domain, const char *assemblyName);
    MonoImage *mono_assembly_get_image(MonoAssembly *assembly);
    MonoMethodDesc *mono_method_desc_new(const char *methodString, gboolean useNamespace);
    MonoMethodDesc *mono_method_desc_free(MonoMethodDesc *desc);
    MonoMethod *mono_method_desc_search_in_image(MonoMethodDesc *methodDesc, MonoImage *image);
    MonoObject *mono_runtime_invoke(MonoMethod *method, void *obj, void **params, MonoObject **exc);
    MonoString *mono_string_new(MonoDomain *domain, const char *text);
    
    void UnitySendInstantMessage(const char * methodName, const char* jsonresult)
    {
        if([iOSViewManager sharedManager]._instantMessageMethod == nil)
            RegisterInstantMessageReceiver();
        
        MonoDomain *domain = mono_domain_get();
        
        MonoString *jsonString = mono_string_new(domain, jsonresult);
        MonoString *methodString = mono_string_new(domain, methodName);
        void *args[] = { methodString, jsonString };
        
        mono_runtime_invoke((MonoMethod *)([iOSViewManager sharedManager]._instantMessageMethod), NULL, args, NULL);
    }
    
    void RegisterInstantMessageReceiver()
    {
        MonoDomain *domain = mono_domain_get();
        NSString *assemblyPath = [[[NSBundle mainBundle] bundlePath]
                                  stringByAppendingPathComponent:@"Data/Managed/Assembly-CSharp.dll"];
        MonoAssembly *assembly = mono_domain_assembly_open(domain, assemblyPath.UTF8String);
        MonoImage *image = mono_assembly_get_image(assembly);
        
        MonoMethodDesc *desc = mono_method_desc_new("MHiOSManager:ReceiveInstantMessage", FALSE);
        MonoMethod *method = mono_method_desc_search_in_image(desc, image);
        mono_method_desc_free(desc);
        
        [iOSViewManager sharedManager]._instantMessageMethod = method;
    }
    
    int _init(int tag)
	{
        if(tag == 0)
        {
            [iOSViewManager sharedManager];
            return 0;
        }
        if(![MHTools objectExists:tag])
        {
            NSObject *obj = [[[NSObject alloc] init] autorelease];
            
            [MHTools addreplaceObject:obj key:tag actualUI:obj];
        }
        else
        {
            NSLog(@"ERROR: This tag is already taken, cannot initiate this object (OBJECT)");
        }
        return tag;
	}
    
    void _release(int tag)
    {
        if(tag == 0)
            return;
        if([MHTools objectExists:tag])
        {
            NSObject *obj = [MHTools getActualObject:tag];
            
            [obj release];
            return;
        }
        NSLog(@"ERROR: Cannot find the object to release");
    }
    
    void _pauseUnity(bool pause)
    {
        if(pause)
            UnityPause(1);
        else
            UnityPause(0);
    }
	
	//labels and imageviews are automatically created, so this just syncs the tag
	void _syncLabel(int tag, int button)
	{
        UIButton *btn = [MHTools getActualObject:button];
        if(btn)
        {
            ALBLabel *label = (ALBLabel *)btn.titleLabel;
            
            [MHTools addreplaceObject:label key:tag actualUI:label];
        }
	}
	
	void _syncImageView(int tag, int button)
	{
        UIButton *btn = [MHTools getActualObject:button];
        if(btn)
        {
            ALBImageView *imgView = (ALBImageView *)btn.imageView;
            
            [MHTools addreplaceObject:imgView key:tag actualUI:imgView];
        }
	}
    
    void _syncNavitem(int tag, int viewController)
    {
        UIViewController *viewcontroller = [MHTools getActualObject:viewController];
        if(viewcontroller)
        {
            ALBNavigationItem *navitem = (ALBNavigationItem *)viewcontroller.navigationItem;
            
            [MHTools addreplaceObject:navitem key:tag actualUI:navitem];
        }
    }
    
    void _syncAlertview(int tag, int textfield, int index)
    {
        UIAlertView *alertview = [MHTools getActualObject:tag];
        if(alertview)
        {
            ALBTextField *tfield = [[[ALBTextField alloc] init] autorelease];
            UITextField *txtfield = [alertview textFieldAtIndex:index];
            txtfield.delegate = tfield;
            
            [MHTools addreplaceObject:tfield key:textfield actualUI:txtfield];
        }
    }
    
    void _syncTableviewcell(int tag, int textLabel, int contentView, int detailTextLabel, int imageView)
    {
        UITableViewCell *tcell = [MHTools getActualObject:tag];
        if(tcell)
        {
            ALBLabel *tlabel = (ALBLabel *)tcell.textLabel;
            ALBView *cview = (ALBView *)tcell.contentView;
            ALBLabel *dtlabel = (ALBLabel *)tcell.detailTextLabel;
            ALBImageView *iview = (ALBImageView *)tcell.imageView;
            
            [MHTools addreplaceObject:tlabel key:textLabel actualUI:tlabel];
            [MHTools addreplaceObject:cview key:contentView actualUI:cview];
            if(dtlabel != nil)
                [MHTools addreplaceObject:dtlabel key:detailTextLabel actualUI:dtlabel];
            [MHTools addreplaceObject:iview key:imageView actualUI:iview];
        }
    }
}
